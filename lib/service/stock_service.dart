import 'package:pinto_admin_flutter/api/api.dart';
import 'package:pinto_admin_flutter/model/stock.dart';
import 'package:pinto_admin_flutter/model/stock_preview.dart';
import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/model/stock_product.dart';
import 'package:pinto_admin_flutter/service/auth.dart';
import 'package:pinto_admin_flutter/service/thai_sort.dart';

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
      stockPreview.sort((a, b) => ThaiSort.compareTo(a.name, b.name));
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
    } on DioError catch (err) {
      return err.response!.data['message'];
    }
  }
  static Future<List<StockProduct>> getStockProduct(int productId) async {
    try {
      var response = await Api.dio.get('/stock-detail/send-stock-product',
        options: Options(
          headers: {
            'userId': Auth.user.userId,
          },
        ),
        queryParameters: {
          'productId': productId
        },
      );
      List<StockProduct> stockProducts = (response.data as List).map((stockProduct) =>
          StockProduct(
              stockProduct
          )).toList();
      return stockProducts;
    } on DioError catch (err) {
      throw err.response!.data['message'];
    } catch (err) {
      throw err.toString();
    }
  }
  static Future<void> receiveStockProduct(int sspId) async {
    try {
      await Api.dio.put('/stock-product/receive',
        options: Options(
          headers: {
            'userId': Auth.user.userId,
          },
        ),
        data: {
          'sspId': sspId
        },
      );
    } on DioError catch (err) {
      throw err.response!.data['message'];
    } catch (err) {
      throw err.toString();
    }
  }
  static Future<void> payStockProduct(int sspId) async {
    try {
      await Api.dio.put('/stock-product/pay',
        options: Options(
          headers: {
            'userId': Auth.user.userId,
          },
        ),
        data: {
          'sspId': sspId
        },
      );
    } on DioError catch (err) {
      throw err.response!.data['message'];
    } catch (err) {
      throw err.toString();
    }
  }
}
