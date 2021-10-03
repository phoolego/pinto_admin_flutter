import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class StatusWithFarmer extends StatefulWidget {
  @override
  _StatusWithFarmerState createState() => _StatusWithFarmerState();
}

class _StatusWithFarmerState extends State<StatusWithFarmer> {
  String productName = 'ผักกาดขาว';
  int status = 3;
  String farmName = 'สมหญิง';
  String stDate = '8/8/2020';
  String edDate = '20/12/2020';
  double predictingToSale = 10;
  double totalPrice = 0;
  String unit = 'กรัม';
  double pricePerUnit = 3;
  String transportDate = '1/7/2020';
  String strStatus = '';

  String checkStatus(int status) {
    if (status == 1) {
      strStatus = 'ยังไม่ได้รับผลิตภัณฑ์';
      return strStatus;
    } else if (status == 2) {
      strStatus = 'ส่งผลผลิตแล้ว';
      return strStatus;
    } else if (status == 3) {
      strStatus = 'ชำระเงินแล้ว';
      return strStatus;
    } else {
      return 'INVALID';
    }
  }

  Color colorStatusText(int status) {
    if (status == 1) {
      return notYetRed;
    } else if (status == 2) {
      return waitingYellow;
    } else if (status == 3) {
      return successGreen;
    } else {
      return Colors.white;
    }
  }

  double calculateTotalPrice(double pricePerUnit) {
    totalPrice = pricePerUnit * predictingToSale;
    if (totalPrice == 0) {
      print('Something wrong totalPrice = 0');
    }
    return totalPrice;
  }

  @override
  void initState() {
    // TODO: implement initState
    checkStatus(status);
    calculateTotalPrice(pricePerUnit);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'ชื่อผลิตภัณฑ์: $productName',
          style: kAppbarTextStyle,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Column(

          children: [
            Container(
              height: screenHeight * 0.13,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.1, 0, screenWidth * 0.1, 0),
              decoration: BoxDecoration(
                color: mediumBlue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'รายการส่งขายวันที่  $transportDate',
                    style: kContentTextWhite,
                  ),
                  Row(
                    children: [
                      Text('สถานะ   ', style: kContentTextWhite),
                      Text(
                        '$strStatus',
                        style: TextStyle(
                            fontFamily: 'SansThai',
                            fontSize: 16.0,
                            color: colorStatusText(status),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                  //SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.04,),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth*0.1, 0, screenWidth*0.2, 10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('เกษตรกร: \n$farmName',style: kContentTextStyle,),
                  SizedBox(height: screenHeight*0.02,),
                  Row(children: [
                    Column(
                      children: [
                        Text('วันที่เริ่มปลูก: ',style: kContentTextStyle,),
                        Text(stDate,style: kContentTextStyle,),
                        SizedBox(height: screenHeight*0.02,)
                      ],
                    ),
                    Expanded(child: Text(' ')),
                    Column(
                      children: [
                        Text('วันที่เก็บเกี่ยว: ',style: kContentTextStyle,),
                        Text(edDate,style: kContentTextStyle,),
                        SizedBox(height: screenHeight*0.02,)
                      ],
                    )
                  ],),
                  Row(children: [
                    Text('ปริมาณที่คาดว่าจะส่งขาย:   ',style: kContentTextStyle,),
                    Text('$predictingToSale   $unit',style: kContentTextStyle,),
                    SizedBox(height: screenHeight*0.04,)
                  ],),
                  Row(children: [
                    Text('เป็นราคา:   ',style: kContentTextStyle,),
                    Text('$totalPrice   บาท',style: kContentTextStyle),
                    SizedBox(height: screenHeight*0.05,)
                  ],),
                  Row(children: [
                    Text('สถานะ:  ',style: kContentTextStyle,),
                    Text(
                      '$strStatus',
                      style: TextStyle(
                          fontFamily: 'SansThai',
                          fontSize: 16.0,
                          color: colorStatusText(status),
                          fontWeight: FontWeight.bold),
                    ),
                  ],),
                ],
              ),)

          ],
        ),
      ),
    );
  }
}
