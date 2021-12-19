import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool>putBoolean ({
    required String key,
    required bool value
  })async{
    return await sharedPreferences.setBool(key, value);
  }
  static bool? getBoolean({required String key}){
   return  sharedPreferences.getBool(key);
  }
}
// class caheHelper1{
//  static late SharedPreferences sharedPreferences;
//  static init()async{
//    sharedPreferences = await SharedPreferences.getInstance();
//  }
//  Future<bool>putBoolean({
//    required String key,
//    required bool value
// })async{
//    return await sharedPreferences.setBool(key, value);
//  }
//  bool? getBoolean({required String key }){
//    return sharedPreferences.getBool(key);
//  }
// }
// class CacheHelper2{
//   static late SharedPreferences sharedPreferences;
//   static init()async{
//     sharedPreferences =await SharedPreferences.getInstance();
//   }
//   static Future<bool> putData({required String key,required String value})async{
//     return await sharedPreferences.setString(key, value);
//   }
//   static String? getData({required String key}){
//     return sharedPreferences.getString(key);
//   }
// }