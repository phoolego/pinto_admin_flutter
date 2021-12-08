import 'package:dio/dio.dart';
import 'package:pinto_admin_flutter/api/api.dart';
import 'package:pinto_admin_flutter/model/order.dart';
import 'dart:convert';

import 'auth.dart';

class OrderService{
  static Future<List<Order>> getOrder(String? status) async {
    try {
      var response = await Api.dio.get(
        '/admin/order',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
        queryParameters: {
          'status': status
        },
      );
      List<Order> order = (response.data as List).map((e) => Order(e)).toList();
      return order;
    } on DioError catch (err) {
      print(err.response!.data['message']);
      return err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> validateOrder(int orderId) async {
    try {
      await Api.dio.put(
        '/admin/order/validate',
        options: Options(
          headers: {'userId': Auth.user.userId},
        ),
        data: {
          'orderId': orderId,
        }
      );
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> completeOrder(int orderId) async {
    try {
      await Api.dio.put(
          '/admin/order/complete',
          options: Options(
            headers: {'userId': Auth.user.userId},
          ),
          data: {
            'orderId': orderId,
          }
      );
    } on DioError catch (err) {
      print(err.response!.data['message']);
      throw err.response!.data['message'];
    } catch (err) {
      print(err.toString());
      throw err.toString();
    }
  }
}