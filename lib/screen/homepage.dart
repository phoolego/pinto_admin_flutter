import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/component/productListCard.dart';
import 'package:pinto_admin_flutter/model/stock_preview.dart';
import 'package:pinto_admin_flutter/screen/stock_dashboard.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';

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
                    'สวัสดี,\nแอดมิน สมหญิง',
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.55,
                  child: Expanded(
                      child: FutureBuilder<List<StockPreview>>(
                    future: StockService.getStockPreviews(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<StockPreview>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<StockPreview> listStockPreview = snapshot.data!;
                        return ListView.builder(
                          itemCount: listStockPreview.length,
                          itemBuilder: (context, index) =>
                              ProductCard.withoutProductID(
                                  productName: listStockPreview[index].name,
                                  inStock: listStockPreview[index]
                                          .sellingAmount +
                                      listStockPreview[index].preorderAmount,
                                  unit: listStockPreview[index].Unit,
                                  function: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StockDashboard(
                                                    productName:
                                                        listStockPreview[index]
                                                            .name)));
                                  }),
                        );
                      }
                    },
                    //       builder: ListView(
                    //   children: [
                    //       ProductCard.withoutProductID(
                    //           productName: 'ผักกาดขาว (mockData)',
                    //           inStock: 10,
                    //           unit: 'กรัม',
                    //           function: () {
                    //             Navigator.pushNamed(context, '/stock/stockDashboard');
                    //           }),
                    //       ProductCard.withoutProductID(
                    //           productName: 'ผักกาดขาว',
                    //           inStock: 10,
                    //           unit: 'กรัม',
                    //           function: () {}),
                    //       ProductCard.withoutProductID(
                    //           productName: 'ผักกาดขาว',
                    //           inStock: 10,
                    //           unit: 'กรัม',
                    //           function: () {}),
                    //       ProductCard.withoutProductID(
                    //           productName: 'ผักกาดขาว',
                    //           inStock: 10,
                    //           unit: 'กรัม',
                    //           function: () {}),
                    //       ProductCard.withoutProductID(
                    //           productName: 'ผักกาดขาว',
                    //           inStock: 10,
                    //           unit: 'กรัม',
                    //           function: () {}),
                    //
                    //   ],
                    // ),
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
