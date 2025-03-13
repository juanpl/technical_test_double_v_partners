
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';


//La idea es crear un singlenton
class UsersLocalDataSource {

  static Database? _database;
  static final UsersLocalDataSource db = UsersLocalDataSource._();
  UsersLocalDataSource._();

  Future<Database?> get database async{

    if(_database != null) return _database;
    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async{

    //Path donde se almacena la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'UsersDB.db');
    print(path);

    //created data base
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version) async{

        await db.execute('''
          CREATE TABLE Users(
            id INTEGER PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            birthdate TEXT,
            email TEXT,
            password TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE Addresses(
            id INTEGER PRIMARY KEY,
            user_id INTEGER,
            address TEXT 
          )
        ''');
      
      }
    );

  }


  Future<int> newUser(User newUser) async {

    final  userExist = await checkUserExist(newUser.email);

    if(userExist==true){
      return 0;
    }

    final Map<String, dynamic> userMap = Map.of(newUser.toJson()); // Hacer una copia del JSON
    userMap.remove('addresses');

    final db = await database;
    final userId = await db!.insert('Users', userMap);
    

    List<int>addressIdList = await addAddressItems(userId, newUser.addresses, db);

    return userId;
  }

  Future<List<int>> addAddressItems(int userId, List<String> addresses, Database? db) async{

    List<int> addressIdList = [];
    
    for(String address in addresses){

      Map<String, Object?> jsonAddress = {
        'user_id': userId,
        'address': address
      };

      final addressId = await db!.insert('Addresses', jsonAddress);
      addressIdList.add(addressId);
    }

    return addressIdList;
  }


  Future<bool> checkUserExist(String email) async {
    final db = await database;
    final res = await db!.query('Users', where: 'email = ?', whereArgs: [email]);

    return res.isNotEmpty
            ? true
            : false;
  }



  Future<User?> getUserByEmailAndPassword ( String email, String password) async{

    final db = await database;
    final res = await db!.query('Users', where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if(res.isEmpty) return null;

    Map<String, Object?> jsonUserTable = res.first;

    int jsonUserTableUserId = jsonUserTable['id'] as int;

    final addressJsonList = await db!.query('Addresses', columns: ['address'], where: 'user_id = ?', whereArgs: [jsonUserTableUserId]);

    List<String> addresses = addressJsonList.map((row) => row['address'] as String).toList();

    Map<String, Object?> jsonUser = {
      "first_name": jsonUserTable['first_name'],
      "last_name": jsonUserTable['last_name'],
      "birthdate": jsonUserTable['birthdate'],
      "email": jsonUserTable['email'],
      "password": jsonUserTable['password'],
      "addresses": addresses
    };
 
    User user = User.fromJson(jsonUser);

    return user;
     
  }

}
