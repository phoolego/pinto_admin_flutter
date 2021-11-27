import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/api/api.dart';
import 'package:pinto_admin_flutter/model/farmer.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class FarmerService{
  static Future<List<Farmer>> getFarmer() async {
    try {
      var response = await Api.dio.get('/all-farmer',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
      );
      List<Farmer> farmer = (response.data as List).map((farmer) => Farmer(
          farmer
      )).toList();
      return farmer;
    } on DioError catch (err) {
      return err.response!.data['message'];
    } catch (err){
      print(err.toString());
      throw err;
    }
  }

  static Future<List<Farmer>> getFarmerRequest() async {
    try {
      var response = await Api.dio.get('/all-farmer-request',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
      );
      List<Farmer> farmer = (response.data as List).map((farmer) => Farmer(
          farmer
      )).toList();
      return farmer;
    } on DioError catch (err) {
      return err.response!.data['message'];
    } catch (err){
      print(err.toString());
      throw err;
    }
  }

  static Future<void> approveFarmer(farmerId) async{
    try {
      await Api.dio.put('/all-farmer-request',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        data: {
          'userId': farmerId
        }
      );
    } on DioError catch (err) {
      return err.response!.data['message'];
    } catch (err){
      print(err.toString());
      throw err;
    }
  }
}