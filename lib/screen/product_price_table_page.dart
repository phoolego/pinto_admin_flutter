import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/product_type.dart';
import 'package:pinto_admin_flutter/service/product_service.dart';
import 'package:pinto_admin_flutter/component/row_price_table.dart';

class ProductPriceTable extends StatefulWidget {
  @override
  _ProductPriceTableState createState() => _ProductPriceTableState();
}

class _ProductPriceTableState extends State<ProductPriceTable> {
  String keyword = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('ตารางรับซื้อ'),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'ตารางราคารับซื้อ',
          style: kAppbarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                0.05 * screenWidth, 0.03 * screenHeight, 0.05 * screenWidth, 0),
            child: TextFormField(
              textAlign: TextAlign.left,
              style: kHeadingTextStyle,
              decoration: const InputDecoration(
                hintText: 'ค้นหา',
                hintStyle: kNormalTextStyle,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  keyword = val;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.025 * screenWidth,
                0.025 * screenHeight, 0.05 * screenWidth, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ตารางแสดงข้อมูล',
                      style: kContentTextMedBlack,
                    ),
                    Text(
                      'รายการสินค้ารับซื้อ',
                      style: kHeadingBoldTextStyle,
                    )
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
                  child: PintoButton(
                    label: '+ เพิ่ม',
                    function: () {
                     Navigator.pushNamed(context, '/stock/productPriceTable/addProduct');
                    },
                    buttonColor: mediumGrayBackground,
                    textStyle: blackSmallNormalTextStyle,
                    width: screenWidth*0.25,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              //padding: EdgeInsets.all(10),
              // height: 0.65 * screenHeight,
              // color: mediumGrayBackground,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: mediumBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 0.15 * screenWidth,
                      child: const Text(
                        'ลำดับ',
                        style: kContentTextWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.35 * screenWidth,
                      child: const Text(
                        'ชื่อสินค้า',
                        style: kContentTextWhite,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      width: 0.15 * screenWidth,
                      child: const Text(
                        'ซื้อ',
                        style: kContentTextWhite,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      width: 0.15 * screenWidth,
                      child: const Text(
                        'ขาย',
                        style: kContentTextWhite,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(
                      width: 0.2 * screenWidth,
                      child: const Text(
                        'หน่วย',
                        style: kContentTextWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<ProductType>>(
                  future: ProductService.getAllProductType(),
                  builder: (BuildContext context, AsyncSnapshot<List<ProductType>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      //List<ProductType> productTypeList = snapshot.data!;
                      List<ProductType> productTypeList = searchOperation(keyword, snapshot.data!);
                      return ListView.builder(
                        itemCount: productTypeList.length,
                        itemBuilder: (context, index) => RowPriceTable(
                          index: index + 1,
                          product: productTypeList[index],
                        )
                      );
                    }
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
    //);
  }

  List<ProductType> searchOperation(
      String keyword, List<ProductType> listOfProduct) {
    List<ProductType> result = [];
    if (keyword.isNotEmpty) {
      for (int index = 0; index < listOfProduct.length; index++) {
        if (listOfProduct[index].name.contains(keyword)) {
          result.add(listOfProduct[index]);
        }
      }
      return result;
    } else {
      return listOfProduct;
    }
  }
}
