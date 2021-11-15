import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/service/product_service.dart';

class AdminAddProductPage extends StatefulWidget {
  @override
  _AdminAddProductPageState createState() => _AdminAddProductPageState();
}

class _AdminAddProductPageState extends State<AdminAddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String _errorMessage ='';

  String name = '';
  String nameEng = '';
  double priceBuy = 0;
  double priceSell = 0;
  String unitAmount = 'ก.ก.';
  String unitPrice = 'บาท';
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              // PintoTextFieldWithoutHintText(label: 'ชื่อผลิตภัณฑ์ (ภาษาไทย)'),
              Container(
                padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                width: 0.8 * screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ชื่อผลิตภัณฑ์ (ภาษาไทย)', style: kContentTextStyle),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'กรุณากรอกชื่อผลิตภัณฑ์ (ภาษาไทย)';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value){
                        name = value;
                      },
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                width: 0.8 * screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ชื่อผลิตภัณฑ์ (ภาษาอังกฤษ)', style: kContentTextStyle),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'กรุณากรอกชื่อผลิตภัณฑ์ (ภาษาไทย)';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value){
                        nameEng = value;
                      },
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                    width: 0.35 * screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ราคาขาย', style: kNormalTextStyle),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            suffixText: unitPrice,
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'กรุณากรอกราคาขาย';
                            }else if(num.tryParse(value)==null || double.parse(value)<=0){
                              return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value){
                            if(num.tryParse(value)!=null && double.parse(value)>0){
                              priceSell=double.parse(value);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                    width: 0.35 * screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ราคาซื้อ', style: kNormalTextStyle),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            suffixText: unitPrice,
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'กรุณากรอกราคาซื้อ';
                            }else if(num.tryParse(value)==null || double.parse(value)<=0){
                              return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                            }else{
                              return null;
                            }
                          },
                          onChanged: (value){
                            if(num.tryParse(value)!=null && double.parse(value)>0){
                              priceBuy=double.parse(value);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  // NumericWithDotTextField(label: 'ราคาขาย'),
                  // NumericWithDotTextField(label: 'ราคาซื้อ')
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                width: 0.8 * screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('หน่วยการซื้อขาย', style: kContentTextStyle),
                    TextFormField(
                      initialValue: 'ก.ก.',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'กรุณากรอกชื่อหน่วยการซื้อขาย';
                        }else{
                          return null;
                        }
                      },
                      onChanged: (value){
                        unitAmount = value;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
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
              SizedBox(
                height: screenHeight * 0.01,
              ),
              pic == null ?
              Container(
                width: screenWidth*0.8,
                height: screenWidth*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Icon(Icons.photo_size_select_actual),
                    Text("เลือกรูปภาพ"),
                  ],
                ),
              ):
              Container(
                width: screenWidth*0.8,
                height: screenWidth*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(pic!),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              PintoButton(
                label: 'เพิ่มผลิตภัณฑ์',
                function: () async{
                  if (_formKey.currentState!.validate()) {
                    try{
                      await ProductService.addProductType(name, nameEng, priceBuy, priceSell, unitAmount, pic);
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/stock/productPriceTable');
                    }catch(err){
                      setState(() {
                        _errorMessage = err.toString();
                      });
                    }
                  }
                },
                buttonColor: deepBlue,
              ),
              Text(_errorMessage,style: const TextStyle(color: Colors.red),),
              SizedBox(height: screenHeight*0.01,),
            ],
          ),
        ),
      ),
    );
  }
}


