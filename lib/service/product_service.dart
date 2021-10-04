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
    }
  }
  static Future<FarmProduct> getFarmProduct(int productId, farmerId) async{
    try {
      var response = await Api.dio.get('/stock-detail/product',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
      );
      return FarmProduct(response.data);
    } on DioError catch (err) {
      return err.response!.data['message'];
    }
  }

}