import 'package:pinto_admin_flutter/api/api.dart';
import 'package:pinto_admin_flutter/model/stock.dart';
import 'package:pinto_admin_flutter/model/stock_preview.dart';
import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class StockService {
  static Future<List<StockPreview>> getStockPreviews() async {
    try {
      var response = await Api.dio.get(
        '/stock-list',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
      );
      List<StockPreview> stockPreview = (response.data as List).map((e) => StockPreview(e)).toList();
      return stockPreview;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }
  }
  static Future<Stock> getStockDetail(String productType) async{
    try {
      var response = await Api.dio.get('/stock-detail',
        options: Options(
          headers: {
            'userId':Auth.user.userId
          },
        ),
        queryParameters: {
          'productType' : productType
        },
      );
      Stock stockDetail = Stock(response.data);
      return stockDetail;
      // List<ProductType> stockdetail =  (response.data as List).map((productType) => ProductType(
      //     productType
      // )).toList();
      // return stockdetail;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }
  }
}
