import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/screen/constant.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/component/productListCard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.withoutAny(),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'คลังสินค้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'สวัสดี,\nแอดมิน สมหญิิง',
                    style: kHeadingTextStyle,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Prompht'),
                          decoration: const InputDecoration(
                            hintText: 'ค้นหา',
                            hintStyle: TextStyle(fontFamily: 'Prompht'),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.63,
                  child: Expanded(
                      child: ListView(
                    children: [
                      ProductCard.withoutProductID(
<<<<<<< HEAD
                          productName: 'ผักกาดขาว',
                          inStock: 10,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'กระเจี๊ยบ',
                          inStock: 22,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          inStock: 20,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          inStock: 5,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          inStock: 2,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          inStock: 32,
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          inStock: 12,
=======
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
                          function: () {}),
                      ProductCard.withoutProductID(
                          productName: 'productName',
                          dateString: 'dateString',
>>>>>>> dev
                          function: () {}),
                    ],
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
