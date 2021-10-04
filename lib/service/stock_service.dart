import 'package:pinto_admin_flutter/api/api.dart';
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
}
