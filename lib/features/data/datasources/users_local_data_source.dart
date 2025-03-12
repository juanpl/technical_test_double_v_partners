
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
          CREATE TABLE Address(
            id INTEGER PRIMARY KEY,
            user_id INTEGER,
            address TEXT 
          )
        ''');
      
      }
    );

  }

  Future<int> newUser(User newUser) async {
    final db = await database;
    final userId = await db!.insert('Users', newUser.toJson().remove('addresses'));
    
    var batch = db.batch(); // Iniciar batch para insertar varias direcciones

    for (String address in newUser.addresses) {
      batch.insert("Address", {"user_id": userId, "address": address});
    }

    await batch.commit(noResult: true);

    return userId;
  }

}
