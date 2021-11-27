import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/farm_info_card.dart';
import 'package:pinto_admin_flutter/model/stock.dart';
import 'package:pinto_admin_flutter/screen/decrease_stock_page.dart';
import 'package:pinto_admin_flutter/screen/farm_product_page.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';

class StockDashboardPage extends StatefulWidget {
  String productName = '';
  StockDashboardPage({required this.productName});

  @override
  _StockDashboardPageState createState() => _StockDashboardPageState();
}

class _StockDashboardPageState extends State<StockDashboardPage> {
  void reload(){
    setState(() {
      print('reload root');
    });
  }
  @override
  Widget build(BuildContext context) {
    Map operation = {
      'root':reload
    };
    return Scaffold(
      appBar: AppBar(
          backgroundColor: deepBlue,
          title: Text(
            widget.productName,
            style: kAppbarTextStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: FutureBuilder<Stock>(
        future: StockService.getStockDetail(widget.productName),
        builder: (BuildContext context, AsyncSnapshot<Stock> snapshot){
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Stock stock =snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: mediumBlue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //SizedBox(height: 10,),
                      Text(
                        'คงเหลือในคลังทั้งหมด: ${stock.preorderAmount+stock.sellingAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      Text(
                        'จำนวนที่วางขาย: ${stock.sellingAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      Text(
                        'จำนวนที่เปิดจอง: ${stock.preorderAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      //SizedBox(height: 10,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children:[
                      Container(
                        padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                        child: Row(
                          children: [
                            Text(
                              'ยอดสั่งซื้อ: ',
                              style: kContentTextMedBlack,
                            ),
                            Expanded(child: Text('')),
                            Text(
                              '${stock.customerSales} ${stock.unit}',
                              style: kContentTextMedBlack,
                            )
                          ],
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              'ยอดการจอง: ',
                              style: kContentTextMedBlack,
                            ),
                            Expanded(child: Text('')),
                            Text(
                              '${stock.customerProOrder} ${stock.unit}',
                              style: kContentTextMedBlack,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: stock.farmers.length,
                          itemBuilder: (context, index)=>FarmInfoCard.withoutProductID(
                            farmName: stock.farmers[index].farmName,
                            unit: stock.unit,
                            inFarm: stock.farmers[index].amount,
                            function: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FarmProductPage(
                                        stockFarm: stock.farmers[index],
                                        productType: widget.productName,
                                        operation: operation,
                                      )
                                  )
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: PintoButton(
                    width: 200,
                    label: 'ลดจำนวนสินค้าในคลัง',
                    buttonColor: deepBlue,
                    function: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DecreaseStockPage(productName: stock.name,operation: operation,) //
                          )
                      );
                    },
                  ),
                ),
                SizedBox(height: 50,),
              ],
            );
          }
        },
      ),
    );
  }
}
