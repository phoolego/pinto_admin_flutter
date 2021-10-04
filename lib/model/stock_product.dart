import 'package:flutter/cupertino.dart';
import 'package:pinto_admin_flutter/constant.dart';

class StockProduct {
  int sspId=0;
  double sspAmount=0;
  double sspPrice=0;
  String sspStatus='';
  String? sspTranPic;
  String unit ='กก.';
  String name = '';
  DateTime plantDate = DateTime.now();
  DateTime createDate = DateTime.now();

  StockProduct(Map<String,dynamic> jsonSsp){
    sspId = jsonSsp['ssp_id'];
    sspAmount = jsonSsp['ssp_amount']+0.0;
    sspPrice = jsonSsp['ssp_price']+0.0;
    sspStatus = jsonSsp['ssp_status'];
    sspTranPic = jsonSsp['ssp_tran_pic'];
    unit = jsonSsp['unit'];
    name = jsonSsp['name'];
    plantDate = DateTime.parse(jsonSsp['plant_date']);
    createDate = DateTime.parse(jsonSsp['ssp_create_date']);
  }
  String getStatus(){
    if(sspStatus=='PREPARE'){
      return 'ยังไม่ได้รับผลิตภัณฑ์';
    }else if(sspStatus=='DELIVERED'){
      return 'ได้รับผลิตภัณฑ์แล้ว';
    }else if(sspStatus=='PAID'){
      return 'ชำระเงินแล้ว';
    }else{
      return '';
    }
  }
  TextStyle getStatusTextStyle(){
    if(sspStatus=='PREPARE'){
      return kNormalErrorTextStyle;
    }else if(sspStatus=='DELIVERED'){
      return kNormalAlertTextStyle;
    }else if(sspStatus=='PAID'){
      return kNormalSuccessTextStyle;
    }else{
      return kNormalErrorTextStyle;
    }
  }
}