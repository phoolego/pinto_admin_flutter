import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/model/farm_product.dart';
import 'package:pinto_admin_flutter/model/stock_product.dart';
import 'package:pinto_admin_flutter/service/date_format.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';

class SellingProductStatusPage extends StatefulWidget {
  FarmProduct farmProduct;
  StockProduct stockProduct;
  Map operation;
  SellingProductStatusPage({
    required this.farmProduct,
    required this.stockProduct,
    required this.operation,
  });
  @override
  _SellingProductStatusPage createState() => _SellingProductStatusPage();
}

class _SellingProductStatusPage extends State<SellingProductStatusPage> {

  bool isButtonShow(){
    if(widget.stockProduct.sspStatus=='PREPARE' || widget.stockProduct.sspStatus=='DELIVERED'){
      return true;
    }else{
      return false;
    }
  }
  String buttonLabel(){
    if(widget.stockProduct.sspStatus=='PREPARE'){
      return 'ได้รับผลิตภัณฑ์แล้ว';
    }else if(widget.stockProduct.sspStatus=='DELIVERED'){
      return 'เพิ่มหลักฐานการชำระเงิน';
    }else{
      return '';
    }
  }
  buttonFunc(BuildContext context){
    if(widget.stockProduct.sspStatus=='PREPARE'){
      return ()async{
        setState((){
          _errorMessage = '';
        });
        try{
          await StockService.receiveStockProduct(widget.stockProduct.sspId);
          widget.operation['root']();
          widget.operation['sspList']();
          widget.operation['farmProduct']();
          Navigator.pop(context);
        }catch(err){
          setState((){
            _errorMessage = err.toString();
          });
        }
      };
    }else if(widget.stockProduct.sspStatus=='DELIVERED'){
      return ()async{
        setState((){
          _errorMessage = '';
        });
        try{
          await StockService.payStockProduct(widget.stockProduct.sspId);
          widget.operation['root']();
          widget.operation['sspList']();
          widget.operation['farmProduct']();
          Navigator.pop(context);
        }catch(err){
          setState((){
            _errorMessage = err.toString();
          });
        }
      };
    }else{
      return (){};
    }
  }

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          widget.farmProduct.typeOfProduct,
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
      body: SingleChildScrollView(
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
                    'รายการส่งขายวันที่ ${DateFormat.getFullDate(widget.stockProduct.createDate)}',
                    style: kContentTextWhite,
                  ),
                  Row(
                    children: [
                      Text('สถานะ ', style: kContentTextWhite),
                      Text(
                        '${widget.stockProduct.getStatus()}',
                        style: widget.stockProduct.getStatusTextStyle(),
                      ),
                    ],
                  )
                  //SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.1, 0, screenWidth * 0.1, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth*0.8,
                    child: Text(
                      'เกษตรกร: \n${widget.farmProduct.firstname} ${widget.farmProduct.lastname}',
                      style: kContentTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth*0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'วันที่เริ่มปลูก: ',
                              style: kContentTextStyle,
                            ),
                            Text(
                              DateFormat.getFullDate(widget.farmProduct.plantDate),
                              style: kContentTextStyle,
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'วันที่เก็บเกี่ยว: ',
                              style: kContentTextStyle,
                            ),
                            Text(
                              DateFormat.getFullDate(widget.farmProduct.predictHarvestDate),
                              style: kContentTextStyle,
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'ปริมาณที่คาดว่าจะส่งขาย:   ',
                  //       style: kContentTextStyle,
                  //     ),
                  //     Text(
                  //       '$predictingToSale   $unit',
                  //       style: kContentTextStyle,
                  //     ),
                  //     SizedBox(
                  //       height: screenHeight * 0.04,
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'เป็นราคา:   ',
                  //       style: kContentTextStyle,
                  //     ),
                  //     Text('$totalPrice   บาท', style: kContentTextStyle),
                  //   ],
                  // ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.farmProduct.status=='PLANTING'?'ปริมาณที่คาดว่าจะส่งขาย':'ปริมาณที่จะส่งขาย',
                              style: kContentTextStyle,
                            ),
                            Text(
                              'เป็นราคา',
                              style: kContentTextStyle,
                            ),
                            Text(
                              'วันที่ส่งผลิตภัณฑ์',
                              style: kContentTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.stockProduct.sspAmount.toString(),
                              style: kContentTextStyle,
                            ),
                            Text(
                              widget.stockProduct.sspPrice.toString(),
                              style: kContentTextStyle,
                            ),
                            Text(
                                widget.stockProduct.deliveredDate==null?'-':DateFormat.getFullDate(widget.stockProduct.deliveredDate!),
                              style: kContentTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.stockProduct.unit,
                              style: kContentTextStyle,
                            ),
                            Text(
                              'บาท',
                              style: kContentTextStyle,
                            ),
                            Text(
                              '',
                              style: kContentTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  isButtonShow()? PintoButton(label: buttonLabel(), function: buttonFunc(context), buttonColor: deepBlue):SizedBox(),
                  Text(_errorMessage,style: kNormalErrorTextStyle,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
