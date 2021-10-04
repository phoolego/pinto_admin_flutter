import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/farm_product.dart';
import 'package:pinto_admin_flutter/model/stock.dart';
import 'package:pinto_admin_flutter/screen/selling_product_list_page.dart';
import 'package:pinto_admin_flutter/service/date_format.dart';
import 'package:pinto_admin_flutter/service/product_service.dart';

class FarmProductPage extends StatefulWidget {
  String productType;
  StockFarm stockFarm;
  FarmProductPage({required this.stockFarm,required this.productType});

  @override
  State<FarmProductPage> createState() => _FarmProductPageState();
}

class _FarmProductPageState extends State<FarmProductPage> {
  @override
  Widget build(BuildContext context) {
    // //String
    // String nullData = 'ไม่มีข้อมูล';
    // String productName = 'ผักกาดขาว';
    // //double farmSize = 100;
    // String unitSize = 'ตร.ม.';
    // String unitAmount = 'กรัม';
    // String unitPrice = 'บาท';
    // String startDate = '01/06/2021';
    // // double expectAmount = 175;
    // // String expectDate = '02/07/2021';
    // double harvestAmount = 25;
    // String harvestDate = '11/07/2021';
    // double sellAmount = 25;
    // double currentStock = 15;
    // double pricePerOne = 20;
    // String farmName = 'สมหญิง';

    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          '${widget.productType}',
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
        child: FutureBuilder<FarmProduct>(
          future: ProductService.getFarmProduct(widget.stockFarm.productId, widget.stockFarm.farmerId),
          builder: (BuildContext context, AsyncSnapshot<FarmProduct> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              FarmProduct farmProduct = snapshot.data!;
              return Container(
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
                            padding: EdgeInsets.fromLTRB(screenWidth*0.1, 5, screenWidth*0.03, 0),
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
                                Text('ฟาร์ม ${widget.stockFarm.farmName}',style: kContentTextWhite,),
                                Text('จำนวนผลิตภัณฑ์ ${farmProduct.currentStock} ${farmProduct.unit} ',style: kContentTextWhite,)
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
                                    alignment: Alignment.center,
                                    //margin: EdgeInsets.only(top: 0.01 * screenHeight),
                                    padding: EdgeInsets.only(
                                        top: 0.01 * screenHeight,
                                        bottom: 0.01 * screenHeight,
                                        left: 0.15 * screenWidth,
                                        right: 0.15 * screenWidth),
                                    decoration: BoxDecoration(
                                      color: lightGrayBackground,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('ราคาต่อหน่วย',
                                                      style: kNormalTextStyle),
                                                  Text('${farmProduct.buyPrice} ${farmProduct.priceUnit}',
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
                                                  Text('วันที่เริ่มปลูก',
                                                      style: kNormalTextStyle),
                                                  Text(DateFormat.getFullDate(farmProduct.plantDate),
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
                                        left: 0.15 * screenWidth,
                                        right: 0.15 * screenWidth),
                                    decoration: BoxDecoration(color: deepWhite),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('ปริมาณที่เก็บเกี่ยว',
                                                      style: kNormalTextStyle),
                                                  Text('${farmProduct.getUsedAmount()} ${farmProduct.unit}',
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
                                                  Text('วันที่เก็บเกี่ยว',
                                                      style: kNormalTextStyle),
                                                  Text(DateFormat.getFullDate(farmProduct.getUsedPlanting()!),
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
                                      left: 0.15 * screenWidth,
                                      right: 0.02 * screenWidth),
                                    decoration: BoxDecoration(
                                      color: lightGrayBackground,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('ปริมาณที่ส่งขายทั้งหมด',
                                                      style: kNormalTextStyle),
                                                  Text('${widget.stockFarm.amount} ${farmProduct.unit}',
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
                                            PintoButton(
                                              width: 200,
                                              label: 'ดูรายการส่งผลิตภัณฑ์',
                                              buttonColor: deepBlue,
                                              function: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => sellingProductListPage(
                                                      productName: widget.productType,
                                                      productId: widget.stockFarm.productId,
                                                    )
                                                  )
                                                );
                                              },
                                            ),
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
              );
            }
          }
        ),
      ),
    );
  }
}
