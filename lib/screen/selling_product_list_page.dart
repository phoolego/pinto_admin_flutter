import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/drop_down.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/component/status_card.dart';

// ignore: must_be_immutable
class sellingProductListPage extends StatefulWidget {
  String productName;
  int productId;
  sellingProductListPage({required this.productName,required this.productId});

  @override
  _sellingProductListPageState createState() => _sellingProductListPageState();
}

class _sellingProductListPageState extends State<sellingProductListPage> {
  double currentStock = 15;
  String unit = 'กรัม';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'รายการส่งสินค้า',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
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
                          padding: EdgeInsets.only(left: 40),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          decoration: BoxDecoration(
                            color: mediumBlue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'ฟาร์ม  ${widget.productName}\nจำนวนผลิตภัณฑ์   $currentStock $unit',
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
                      child: DropDown.withoutAny(),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    0.05 * screenWidth, 0, 0.05 * screenWidth, 0),
                child: ListView(
                  children: [
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),
                    StatusCard.withoutAny(),

                  ],
                ),
                // child: FutureBuilder<List<StockProduct>>(
                //   future: ProductService.getStockProduct(widget.product.productId),
                //   builder: (BuildContext context, AsyncSnapshot<List<StockProduct>> snapshot) {
                //     if(!snapshot.hasData){
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }else if(snapshot.hasError){
                //       return Center(
                //           child: Text(snapshot.error.toString())
                //       );
                //     }else{
                //       List<StockProduct> stockProducts = snapshot.data!;
                //       return ListView.builder(
                //         itemCount: stockProducts.length,
                //         itemBuilder: (context, index)=> StatusCard(
                //             stockProduct: stockProducts[index],
                //             function: (){
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(builder: (context) => StatusProductSellPage(stockProduct: stockProducts[index]))
                //               );
                //             }
                //         ),
                //       );
                //     }
                //   },
                // ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: 20),
            //   width: screenWidth,
            //   color: Colors.deepOrange,
            //   // child: Column(
            //   //   crossAxisAlignment: CrossAxisAlignment.start,
            //   //   children: [
            //   //     Text('ปริมาณที่ขายได้ทั้งหมด ${widget.product.getusedAmount()} ${widget.product.unit} ${
            //   //         widget.product.status=='PLANTING'?'จากการคาดการ':'จากการเก็บเกี่ยว'}',style: kNormalTextStyle,),
            //   //     FutureBuilder<List<StockProduct>>(
            //   //       future: ProductService.getStockProduct(widget.product.productId),
            //   //       builder: (BuildContext context, AsyncSnapshot<List<StockProduct>> snapshot) {
            //   //         if(!snapshot.hasData){
            //   //           return Text('ปริมาณที่ส่งขาย 0 ${widget.product.unit}',style: kNormalTextStyle,);
            //   //         }else if(snapshot.hasError){
            //   //           return Text('ปริมาณที่ส่งขาย - ${widget.product.unit}',style: kNormalTextStyle,);
            //   //         }else{
            //   //           List<StockProduct> stockProducts = snapshot.data!;
            //   //           double totalSell = 0;
            //   //           for(StockProduct p in stockProducts){
            //   //             totalSell+= p.sspAmount;
            //   //           }
            //   //           return Text('ปริมาณที่ส่งขาย $totalSell ${widget.product.unit}',style: kNormalTextStyle);
            //   //         }
            //   //       },
            //   //     ),
            //   //   ],
            //   // ),
            // )
          ],
        ),
      ),
    );
  }
}