import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/product_type.dart';
import 'package:pinto_admin_flutter/service/product_service.dart';

class ProductPriceTable extends StatefulWidget {
  @override
  _ProductPriceTableState createState() => _ProductPriceTableState();
}

class _ProductPriceTableState extends State<ProductPriceTable> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'ตารางราคารับซื้อ',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0.05 * screenWidth,
                  0.03 * screenHeight, 0.05 * screenWidth, 0),
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
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.05 * screenWidth,
                  0.025 * screenHeight, 0.05 * screenWidth, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ),
            Container(
                //padding: EdgeInsets.all(10),
                height: 0.65 * screenHeight,
                color: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: mediumBlue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'ลำดับ',
                            style: kContentTextWhite,
                          ),
                          Text(
                            'ชื่อสินค้า',
                            style: kContentTextWhite,
                          ),
                          Text(
                            'ซื้อ',
                            style: kContentTextWhite,
                          ),
                          Text(
                            'ขาย',
                            style: kContentTextWhite,
                          ),
                          Text(
                            'หน่วย',
                            style: kContentTextWhite,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<ProductType>>(
                        future: ProductService.getAllProductType(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ProductType>> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<ProductType> productTypeList = snapshot.data!;
                            return ListView.builder(
                                itemCount: productTypeList.length,
                                itemBuilder: (context, index) =>
                                    productPriceRow(
                                        index: index + 1,
                                        productName:
                                            productTypeList[index].name,
                                        buyPrice:
                                            productTypeList[index].priceBuy,
                                        sellPrice:
                                            productTypeList[index].priceSell,
                                        unit: productTypeList[index].unit));
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class productPriceRow extends StatelessWidget {
  int index;
  String productName;
  double sellPrice;
  double buyPrice;
  String unit;

  productPriceRow(
      {required this.index,
      required this.productName,
      required this.buyPrice,
      required this.sellPrice,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            index.toString(),
            style: kContentTextWhite,
          ),
          Text(
            '$productName',
            style: kContentTextWhite,
          ),
          Text(
            '$buyPrice',
            style: kContentTextWhite,
          ),
          Text(
            '$sellPrice',
            style: kContentTextWhite,
          ),
          Text(
            '$sellPrice',
            style: kContentTextWhite,
          ),
        ],
      ),
    );
  }
}
