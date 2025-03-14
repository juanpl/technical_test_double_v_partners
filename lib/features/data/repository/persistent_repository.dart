
import 'dart:convert';
import 'package:technical_test_double_v_partners/features/data/datasources/persistent_data_source.dart';
import 'package:technical_test_double_v_partners/features/domain/entities/user.dart';

class PersistentRepository {

  void setUserInfo(User user){
    Map<String, dynamic> jsonUser = user.toJson();
    String stringJsonUser = jsonEncode(jsonUser);
    PersistentDataSource.userInfo = stringJsonUser;
  }

  User getUserInfo(){
    String stringJsonUser = PersistentDataSource.userInfo;
     Map<String, dynamic> jsonUser = jsonDecode(stringJsonUser);
     User userInfo = User.fromJson(jsonUser);
     return userInfo;
  }

}