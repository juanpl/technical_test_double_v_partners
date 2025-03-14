
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:technical_test_double_v_partners/config/utils/password_hasher.dart';
import 'package:technical_test_double_v_partners/features/data/datasources/users_local_data_source.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';

class AuthRepository {

    final storage = new FlutterSecureStorage();

    Future<int> suscribeUser(User newUser) async{

      String hasherPassword = PasswordHasher.hashPassword(newUser.password);
      newUser.password = hasherPassword;
      final int userId = await UsersLocalDataSource.db.newUser(newUser);

      if(userId!=0){
        await storage.write(key: 'token', value: hasherPassword);
      }
    
      return userId;
    }

    Future<User?> loginUser(String email, String password) async{
      User? userLogin = await UsersLocalDataSource.db.getUserByEmailAndPassword(email, password);

      if(userLogin!=null){
        userLogin.password = password;
        await storage.write(key: 'token', value: userLogin!.password);
      }
      
      return userLogin;
    }

    Future logOut () async{
      await storage.delete(key: 'token');
    }

    Future<String> readToken() async{
      return await storage.read(key: 'token') ?? '';
    }


}
