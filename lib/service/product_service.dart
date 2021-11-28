import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:pinto_admin_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/model/farm_product.dart';
import 'package:pinto_admin_flutter/model/product_type.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class ProductService{
  static Future<List<ProductType>> getAllProductType() async{
    try {
      var response = await Api.dio.get('/product-type',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
      );
      List<ProductType> productType = (response.data as List).map((productType) => ProductType(
          productType
      )).toList();
      return productType;
    } on DioError catch (err) {
      return err.response!.data['message'];
    } catch (err){
      print(err.toString());
      throw err;
    }
  }
  static Future<FarmProduct> getFarmProduct(int productId,int farmerId) async{
    try {
      var response = await Api.dio.get('/stock-detail/product',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        queryParameters: {
          'productId':productId,
          'farmerId':farmerId
        },
      );
      return FarmProduct(response.data);
    } on DioError catch (err) {
      throw err.response!.data['message'];
    } catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> addProductType(String name, String nameEng, double priceBuy, double priceSell, String unit,File? img) async{
    try {
      await Api.dio.post('/product-type/insert',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        data: {
          'name':name,
          'nameEng':nameEng,
          'priceBuy':priceBuy,
          'priceSell':priceSell,
          'unit':unit
        },
      );
      if(img != null){
        String fileName = img.path.split('/').last;
        FormData formData = FormData.fromMap({
          'name':name,
          'nameEng':nameEng,
          'productPic':await MultipartFile.fromFile(img.path, filename:fileName,contentType: MediaType('image', fileName.split('.').last))
        });
        await Api.dio.put('/product-type/update/pic',
          data: formData,
          options: Options(
            headers: {
              'userId':Auth.user.userId,
            },
            contentType: 'multipart/form-data',
          ),
        );
      }
    } on DioError catch (err) {
      if(err.response!.data['message']=='duplicate named'){
        throw 'ชื่อถูกใช้ไปแล้ว';
      }else{
        throw err.response!.data['message'];
      }
    } catch(err){
      throw err.toString();
    }
  }
  static Future<void>editProductType(String oldName,String name, String nameEng, double priceBuy, double priceSell, String unit, File? img) async{
    try {
      await Api.dio.put('/product-type/update',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        data: {
          'oldName':oldName,
          'name':name,
          'nameEng':nameEng,
          'priceBuy':priceBuy,
          'priceSell':priceSell,
          'unit':unit
        },
      );
      if(img != null){
        String fileName = img.path.split('/').last;
        FormData formData = FormData.fromMap({
          'name':name,
          'nameEng':nameEng,
          'productPic':await MultipartFile.fromFile(img.path, filename:fileName,contentType: MediaType('image', fileName.split('.').last))
        });
        await Api.dio.put('/product-type/update/pic',
          data: formData,
          options: Options(
            headers: {
              'userId':Auth.user.userId,
            },
            contentType: 'multipart/form-data',
          ),
        );
      }
    } on DioError catch (err) {
      if(err.response!.data['message']=='duplicate named'){
        throw 'ชื่อถูกใช้ไปแล้ว';
      }else{
        throw err.response!.data['message'];
      }
    } catch(err){
      throw err.toString();
    }
  }
}