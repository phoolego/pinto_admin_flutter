import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/order_item.dart';

class Order {
  int orderId = 0;
  String paymentType = '';
  String status = '';
  String deliveryType = '';
  DateTime createdDate = DateTime.now();
  int userId = 0;
  double deliveryPrice = 0;
  List<OrderItem> orderItems = [];
  String? tranPic;
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';

  Order(Map<String, dynamic> jsonOrder) {
    orderId = jsonOrder['order_id'] + 0;
    paymentType = jsonOrder['payment_type'];
    status = jsonOrder['status'];
    deliveryType = jsonOrder['delivery_type'];
    createdDate = DateTime.parse(jsonOrder['created_date']);
    userId = jsonOrder['user_id'] + 0;
    deliveryPrice = jsonOrder['delivery_price'] + 0.0;
    tranPic = jsonOrder['tran_pic'];
    orderItems = (jsonOrder['orderItem'] as List).map((e) => OrderItem(e)).toList();
    firstname = jsonOrder['firstname'];
    lastname = jsonOrder['lastname'];
    email = jsonOrder['email'];
    address = jsonOrder['address'];
    contact = jsonOrder['contact'];
  }

  static List<Order> searchOperation(String keyword, List<Order> orders) {
    List<Order> result = [];
    if(keyword.isNotEmpty){
      for (int index = 0; index < orders.length; index++) {
        if (orders[index].firstname.contains(keyword) || orders[index].lastname.contains(keyword)) {
          result.add(orders[index]);
        }
      }
      return result;
    }else{
      return orders;
    }
  }
  String getStatus(){
    if(status=='WAIT'){
      return 'รอการชำระเงิน';
    }else if(status=='PAID'){
      return 'รอการตรวจสอบ';
    }else if(status=='VALIDATE'){
      return 'รอการจัดส่ง';
    }else if(status=='COMPLETE'){
      return 'เสร็จสิ้น';
    }else{
      return '';
    }
  }
  TextStyle getStatusTextStyle(){
    if(status=='WAIT'){
      return kNormalErrorTextStyle;
    }else if(status=='PAID'){
      return kNormalAlertTextStyle;
    }else if(status=='VALIDATE'){
      return kNormalSuccessTextStyle;
    }else if(status=='COMPLETE'){
      return kContentTextWhite;
    }else{
      return kContentTextWhite;
    }
  }
}
