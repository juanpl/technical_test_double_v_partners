
import 'package:shared_preferences/shared_preferences.dart';

class PersistentDataSource {

  static late SharedPreferences _persistentUserInfo;

  static String _userInfo = '';

  static Future init() async{
    _persistentUserInfo = await SharedPreferences.getInstance();
  }

  static String get userInfo {
    return _persistentUserInfo.getString('_userInfo') ?? _userInfo;
  }

  static set userInfo( String userInfo){
    _userInfo = userInfo;
    _persistentUserInfo.setString('userInfo', userInfo);
  }






}