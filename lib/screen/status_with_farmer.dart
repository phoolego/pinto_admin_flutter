import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class StatusWithFarmer extends StatelessWidget {

  String productName = '';
  int status = 1;
  String farmName = 'สมหญิง';
  String stDate = '8/8/2020';
  String edDate = '20/12/2020';
  double predictingToSale = 10;
  double totalPrice = 30;
  String unit = 'กรัม';

  String checkStatus(int status){
    if(status==1){
      return 'ยังไม่ได้รับผลิตภัณฑ์';
    }else if(status==2){
      return 'ส่งผลผลิตแล้ว';
    }else if(status==3){
      return 'ชำระเงินแล้ว';
    }else{
      return 'INVALID';
    }
  }



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'ชื่อผลิตภัณฑ์: $productName',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

    );
  }
}
