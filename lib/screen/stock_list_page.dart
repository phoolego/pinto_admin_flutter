import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/component/productListCard.dart';
import 'package:pinto_admin_flutter/model/stock_preview.dart';
import 'package:pinto_admin_flutter/screen/stock_dashboard_page.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class StockListPage extends StatefulWidget {
  @override
  _StockListPage createState() => _StockListPage();
}

class _StockListPage extends State<StockListPage> {
  String firstName = Auth.user.firstname;
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('จัดการคลังสินค้า'),
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
            Text(
              'สวัสดี,\nแอดมิน ${firstName}',
              style: kHeadingTextStyle,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
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
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: FutureBuilder<List<StockPreview>>(
                      future: StockService.getStockPreviews(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<StockPreview>> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          //List<StockPreview> listStockPreview = snapshot.data!;
                          List<StockPreview> listStockPreview = searchOperation(keyword, snapshot.data!);
                          return ListView.builder(
                            itemCount: listStockPreview.length,
                            itemBuilder: (context, index) =>
                                ProductCard.withoutProductID(
                                    productName: listStockPreview[index].name,
                                    inStock: listStockPreview[index]
                                            .sellingAmount +
                                        listStockPreview[index].preorderAmount,
                                    unit: listStockPreview[index].unit,
                                    function: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StockDashboardPage(
                                                      productName:
                                                          listStockPreview[
                                                                  index]
                                                              .name)));
                                    }),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<StockPreview> searchOperation(String keyword, List<StockPreview> listStock) {
    List<StockPreview> result = [];
    if(keyword.isNotEmpty){
      for (int index = 0; index < listStock.length; index++) {
        if (listStock[index].name.contains(keyword)) {
          result.add(listStock[index]);
        }
      }
      return result;
    }else{
      return listStock;
    }
  }
}
