import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/%E0%B9%8Cpinto_numeric_text_field.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/component/pinto_text_field.dart';
import 'package:pinto_admin_flutter/constant.dart';

class AdminAddProductPage extends StatefulWidget {
  @override
  _AdminAddProductPageState createState() => _AdminAddProductPageState();
}

class _AdminAddProductPageState extends State<AdminAddProductPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'เพิ่มรายการสินค้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              PintoTextFieldWithoutHintText(label: 'ชื่อผลิตภัณฑ์ (ภาษาไทย)'),
              PintoTextFieldWithoutHintText(
                  label: 'ชื่อผลิตภัณฑ์ (ภาษาอังกฤษ)'),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumericWithDotTextField(label: 'ราคาขาย'),
                    NumericWithDotTextField(label: 'ราคาซื้อ')
                  ],
                ),
              ),
              PintoTextFieldWithoutHintText(label: 'หน่วยที่ขาย'),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              PintoButton(
                label: '+ เพิ่มรูปภาพ',
                function: () {
                  print('เย้ กดปุ่มเพิ่มรูปภาพแล้วว');
                },
                buttonColor: mediumGrayBackground,
                textStyle: blackSmallNormalTextStyle,
                width: screenWidth * 0.25,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              PintoButton(
                label: 'เพิ่มผลิตภัณฑ์',
                function: () {
                  print('ว้าว เพิ่มผลิตภัณฑ์');
                },
                buttonColor: deepBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


