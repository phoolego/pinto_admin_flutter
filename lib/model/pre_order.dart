import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class PreOrder {
  int ppoId = 0;
  int userId = 0;
  String status = '';
  double amount = 0.0;
  DateTime? sellingDate;
  String productType = '';
  String unit = '';
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';

  PreOrder(Map<String, dynamic> json) {
    ppoId = json['ppo_id'] + 0;
    userId = json['user_id'] + 0;
    status = json['status'];
    amount = json['amount'] + 0.0;
    sellingDate = json['selling_date']!=null?DateTime.parse(json['selling_date']).toLocal():null;
    productType = json['type_of_product'];
    unit = json['unit'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    address = json['address'];
    contact = json['contact'];
  }

  static List<PreOrder> searchOperation(String keyword, List<PreOrder> orders) {
    List<PreOrder> result = [];
    if(keyword.isNotEmpty){
      for (int index = 0; index < orders.length; index++) {
        if (orders[index].firstname.contains(keyword) || orders[index].lastname.contains(keyword)
        || orders[index].productType.contains(keyword)) {
          result.add(orders[index]);
        }
      }
      return result;
    }else{
      return orders;
    }
  }

  String getStatus(){
    if(status=='ACTIVE'){
      return 'รอผลิตภัณฑ์';
    }else if(status=='WAIT'){
      return 'รอการยืนยันการสั่งซื้อ';
    }else{
      return '';
    }
  }
  TextStyle getStatusTextStyle(){
    if(status=='ACTIVE'){
      return kNormalSuccessTextStyle;
    }else if(status=='WAIT'){
      return kNormalAlertTextStyle;
    }else{
      return kNormalErrorTextStyle;
    }
  }
}
