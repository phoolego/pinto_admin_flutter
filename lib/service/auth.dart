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
      if(err.response==null){
        throw 'การเชื่อมต่อขัดข้อง';
      }else if(err.response!.statusCode==403){
        throw 'กรุณากรอก อีเมล และ รหัสผ่าน';
      }else if(err.response!.data['message']=='wrong password'){
        throw 'รหัสผ่านไม่ถูกต้อง';
      }else if(err.response!.data['message']=='Do not have permission'){
        throw 'คุณไม่มีสิทธิ์ในการเข้าใช้งาน';
      }else if(err.response!.data['message']=='no user found'){
        throw 'ไม่พบบัญชีผู้ใช้';
      }else{
        throw 'ระบบขัดข้อง';
      }
    }
  }
  static Future<void> logout() async{
    user = User.notLogin();
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
  }
  static Future<void> updateUser(String firstname, String lastname, String address, String contact) async {
    try {
      var response = await Api.dio.put('/update-user',
        data:{
          'firstname':firstname,
          'lastname':lastname,
          'address':address,
          'contact':contact,
          'userId': user.userId
        }
      );
      user = User(response.data);
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }
  }
  static Future<User> getLoginUser() async{
    try{
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
    }catch(err){
      return User.notLogin();
    }
  }
}