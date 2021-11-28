import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      return 'ยืนยันการชำระเงิน';
    }else{
      return '';
    }
  }
  buttonFunc(BuildContext context){
    if(widget.stockProduct.sspStatus=='PREPARE'){
      return ()async{
        showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
            AlertDialog(
              title: const Text('คำเตือน',
                style: kHeadingTextStyle),
              content: const Text(
                'การกระทำนี้ไม่สามารถแก้ไขได้ภายหลัง ต้องการยืนยันการกระทำหรือไม่?',
                style: kContentTextStyle),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'ยกเลิก',
                    style: kContentTextStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
                TextButton(
                  child: const Text(
                    'ยืนยัน',
                    style: kContentTextStyle,
                  ),
                  onPressed: ()async{
                    setState((){
                      _errorMessage = '';
                    });
                    try{
                      await StockService.receiveStockProduct(widget.stockProduct.sspId);
                      widget.operation['StockDashboardPage']();
                      widget.operation['FarmProductPage']();
                      widget.operation['SellingProductListPage']();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }catch(err){
                      setState((){
                        _errorMessage = err.toString();
                        Navigator.pop(context);
                      });
                    }
                  },
                )
              ],
            )
        );
      };
    }else if(widget.stockProduct.sspStatus=='DELIVERED'){
      return ()async{
        if(pic==null){
          setState(() {
            _errorMessage='กรุณาเพิ่มหลักฐานการชำระเงิน';
          });
        }else{
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
              AlertDialog(
                title: const Text('คำเตือน',
                  style: kHeadingTextStyle),
                content: const Text(
                  'การกระทำนี้ไม่สามารถแก้ไขได้ภายหลัง ต้องการยืนยันการกระทำหรือไม่?',
                  style: kContentTextStyle),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'ยกเลิก',
                      style: kContentTextStyle,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                  TextButton(
                    child: const Text(
                      'ยืนยัน',
                      style: kContentTextStyle,
                    ),
                    onPressed: ()async{
                      setState((){
                        _errorMessage = '';
                      });
                      try{
                        await StockService.payStockProduct(widget.stockProduct.sspId,pic);
                        widget.operation['StockDashboardPage']();
                        widget.operation['FarmProductPage']();
                        widget.operation['SellingProductListPage']();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }catch(err){
                        setState((){
                          _errorMessage = err.toString();
                          Navigator.pop(context);
                        });
                      }
                    }
                  )
                ],
              )
          );
        }
      };
    }else{
      return (){};
    }
  }
  File? pic;
  final picker = ImagePicker();
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1024,maxWidth: 1024);
    setState(() {
      pic = File(pickedFile!.path);
    });
  }
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1024,maxWidth: 1024);
    setState(() {
      pic = File(pickedFile!.path);
    });
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
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.13,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.1, 0, screenWidth * 0.1, 0),
              decoration: const BoxDecoration(
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
                      const Text('สถานะ ', style: kContentTextWhite),
                      Text(
                        widget.stockProduct.getStatus(),
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
                            const Text(
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
                            const Text(
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
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.farmProduct.status=='PLANTING'?'ปริมาณที่จะส่งขาย*':'ปริมาณที่ส่งขาย',
                              style: kContentTextStyle,
                            ),
                            const Text(
                              'เป็นราคา',
                              style: kContentTextStyle,
                            ),
                            const Text(
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
                            const Text(
                              'บาท',
                              style: kContentTextStyle,
                            ),
                            const Text(
                              '',
                              style: kContentTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  widget.stockProduct.sspStatus=='PREPARE'?
                  SizedBox():
                  pic != null ? Container(
                    width: screenWidth*0.8,
                    height: screenWidth*1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(pic!),
                      ),
                    ),
                  ):widget.stockProduct.tranPic != null ?
                  Container(
                    width: screenWidth*0.8,
                    height: screenWidth*1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.stockProduct.tranPic!),
                      ),
                    ),
                  ):
                  Container(
                    width: screenWidth*0.8,
                    height: screenWidth*1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: deepGrayBackground
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('เพิ่มหลักฐานการชำระเงิน'),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        PintoButton(
                          label: '+ คลังรูปภาพ',
                          function: getImageFromGallery,
                          buttonColor: mediumGrayBackground,
                          textStyle: blackSmallNormalTextStyle,
                          // width: screenWidth * 0.25,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        PintoButton(
                          label: '+ ถ่ายภาพ',
                          function: getImageFromCamera,
                          buttonColor: mediumGrayBackground,
                          textStyle: blackSmallNormalTextStyle,
                          // width: screenWidth * 0.25,
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  isButtonShow()? PintoButton(label: buttonLabel(), function: buttonFunc(context), buttonColor: deepBlue):const SizedBox(),
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
