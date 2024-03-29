import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/drop_down.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/component/status_card.dart';
import 'package:pinto_admin_flutter/model/farm_product.dart';
import 'package:pinto_admin_flutter/model/stock_product.dart';
import 'package:pinto_admin_flutter/screen/selling_product_status_page.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';

// ignore: must_be_immutable
class SellingProductListPage extends StatefulWidget {
  String farmName;
  int productId;
  double productAmount;
  FarmProduct farmProduct;
  Map operation;
  SellingProductListPage({
    required this.farmName,
    required this.productId,
    required this.productAmount,
    required this.farmProduct,
    required this.operation,
  });

  @override
  _SellingProductListPageState createState() => _SellingProductListPageState();
}

class _SellingProductListPageState extends State<SellingProductListPage> {
  String status='ทั้งหมด';
  void reload(){
    setState(() {
      print('reload SellingProductListPage');
    });
  }
  @override
  Widget build(BuildContext context) {
    widget.operation['SellingProductListPage']=reload;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รายการส่งสินค้า',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.only(left: 40),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: mediumBlue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'ฟาร์ม  ${widget.farmName}\nจำนวนผลิตภัณฑ์ ${widget.productAmount} ${widget.farmProduct.unit}',
                            style: kContentTextWhite,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.9 * screenWidth,
                      //height: 0.2 * screenHeight,
                      child: DropDown.sendStockProduct(
                        (String? val){
                          setState(() {
                            status=val!;
                          });
                        }
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    0.05 * screenWidth, 0, 0.05 * screenWidth, 0),
                child: FutureBuilder<List<StockProduct>>(
                  future: StockService.getStockProduct(widget.productId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<StockProduct>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      List<StockProduct> stockProducts = snapshot.data!;
                      stockProducts = stockProducts.where((e) =>status=='ทั้งหมด'|| e.getStatus()==status).toList();
                      return ListView.builder(
                        itemCount: stockProducts.length,
                        itemBuilder: (context, index) => StatusCard(
                            stockProduct: stockProducts[index],
                            function: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SellingProductStatusPage(
                                    farmProduct: widget.farmProduct,
                                    stockProduct: stockProducts[index],
                                    operation: widget.operation,
                                    ))
                              );
                            }
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
