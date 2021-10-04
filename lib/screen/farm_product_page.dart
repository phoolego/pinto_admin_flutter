import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_admin_flutter/constant.dart';

class FarmProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //String
    String nullData = 'ไม่มีข้อมูล';
    String productName = 'ผักกาดขาว';
    //double farmSize = 100;
    String unitSize = 'ตร.ม.';
    String unitAmount = 'กรัม';
    String unitPrice = 'บาท';
    String startDate = '01/06/2021';
    // double expectAmount = 175;
    // String expectDate = '02/07/2021';
    double harvestAmount = 25;
    String harvestDate = '11/07/2021';
    double sellAmount = 25;
    double currentStock = 15;
    double pricePerOne = 20;
    String farmName = 'สมหญิง';

    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          '$productName',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: deepGrayBackground),
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 0.35 * screenHeight,
                  constraints: BoxConstraints(
                    minWidth: screenWidth,
                  ),
                  alignment: AlignmentDirectional.topCenter,
                  child: Image.asset(
                    'assets/images/Icons.jpg',
                  ),
                ),
              ),
              Positioned(
                top: 0.3 * screenHeight,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.05, 5, screenWidth*0.03, 0),
                      height: screenHeight*0.08,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: deepBlue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ฟาร์ม $farmName',style: kContentTextWhite,),
                          Text('จำนวนผลผลิตภัณฑ์  $currentStock $unitAmount ',style: kContentTextWhite,)
                        ],
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.7 -
                          MediaQuery.of(context).padding.top -
                          kToolbarHeight,
                      width: screenWidth,
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          0.01 * screenHeight),
                      // alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: deepWhite,
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(20),
                        //   topRight: Radius.circular(20),
                        // ),
                      ),
                      child: SingleChildScrollView(
                        // margin: EdgeInsets.only(top: 0.1*screenHeight),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(top: 0.01 * screenHeight),
                              padding: EdgeInsets.only(
                                  top: 0.01 * screenHeight,
                                  bottom: 0.01 * screenHeight,
                                  left: 0.05 * screenWidth,
                              right: 0.02 * screenWidth),
                              decoration: BoxDecoration(
                                color: lightGrayBackground,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 0.43 * screenWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ราคาต่อหน่วย:',
                                                style: kNormalTextStyle),
                                            Text('$pricePerOne บาท',
                                                style: kNormalTextStyle)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        //width: 0.43 * screenWidth,
                                        child: Column(
                                          children: [
                                            Text('วันที่เริ่มปลูก:',
                                                style: kNormalTextStyle),
                                            Text('$startDate',
                                                style: kNormalTextStyle),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 0.01 * screenHeight,
                                  bottom: 0.01 * screenHeight,
                                  left: 0.05 * screenWidth,
                                  right: 0.02 * screenWidth),
                              decoration: BoxDecoration(color: deepWhite),
                              child: Row(

                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 0.43 * screenWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('ปริมาณที่เก็บเกี่ยว:',
                                                style: kNormalTextStyle),
                                            Text('$harvestAmount $unitAmount',
                                                style: kNormalTextStyle)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        //width: 0.43 * screenWidth,
                                        child: Column(
                                          children: [
                                            Text('วันที่เก็บเกี่ยว:',
                                                style: kNormalTextStyle),
                                            Text('$harvestDate',
                                                style: kNormalTextStyle),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 0.01 * screenHeight,
                                  bottom: 0.01 * screenHeight,
                                  left: 0.05 * screenWidth,
                                  right: 0.02 * screenWidth),
                              decoration: BoxDecoration(
                                color: lightGrayBackground,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 0.43 * screenWidth,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('ปริมาณที่ส่งขายทั้งหมด:',
                                                style: kNormalTextStyle),
                                            Text('$sellAmount $unitAmount',
                                                style: kNormalTextStyle)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        //width: 0.43 * screenWidth,
                                        child: Column(
                                          children: [
                                            Text('',
                                                style: kNormalTextStyle),
                                            Text('',
                                                style: kNormalTextStyle),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 0.08 * screenHeight,
                                  bottom: 0.01 * screenHeight),
                              decoration: BoxDecoration(color: deepWhite),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 0.03 * screenHeight),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.01 * screenWidth,
                                                0.005 * screenHeight,
                                                0.01 * screenWidth,
                                                0.005 * screenHeight),
                                            child: Text('ดูรายการส่งผลิตภัณฑ์',
                                                style:
                                                    whiteSmallNormalTextStyle)),
                                        style: ElevatedButton.styleFrom(
                                            primary: deepBlue),
                                        onPressed: () {
                                          print('Pressed');
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => ProductEditDetailsPage(),
                                          //   ),
                                          // );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.05 * screenHeight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
