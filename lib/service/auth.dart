import 'package:pinto_admin_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  static final _storage = FlutterSecureStorage();
  static User user = User.notLogin();

  static Future<User> login(String? email,String? password) async {
    try {
      var response = await Api.dio.post('/login-email-admin',
          data:{'email':email,'password':password}
      );
      user = User(response.data);
      await _storage.write(key: 'email', value: email);
      await _storage.write(key: 'password', value: password);
      return User(response.data);
    } on DioError catch (err) {
      // print(err.response!.statusCode);
      // print(err.response!.data['message']);
      throw err.response!.data['message'];
    }
  }
  static Future<void> logout() async{
    user = User.notLogin();
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
  }
  static Future<int> register(String username,String email,String password,String address,String contact) async {
    try {
      var response = await Api.dio.post('/insert-user',
        data:{
          'username':username,
          'email':email,
          'password':password,
          'address':address,
          'contact':contact,
          'role':'ADMIN'
        }
      );
      return response.data['insertId'];
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }
  }
  static Future<User> getLoginUser() async{
    if(user.userId!=0){
      return user;
    }else{
      Map<String, String> userData = await _storage.readAll();
      if(userData['email']!=null && userData['password']!=null){
        return await login(userData['email'], userData['password']);
      }else{
        return User.notLogin();
      }
    }

  }
}