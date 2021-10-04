import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/stock_product.dart';
import 'package:pinto_admin_flutter/service/date_format.dart';

class StatusCard extends StatelessWidget {
  StockProduct stockProduct;
  var function;

  StatusCard({required this.stockProduct, required this.function});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: screenWidth * 0.1,
        padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: deepBlue,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายการส่งขายวันที่: ${DateFormat.getFullDate(stockProduct.createDate)}',
                        style: kContentTextWhite,
                      ),
                      Text(
                        'จำนวน: ${stockProduct.sspAmount} ${stockProduct.unit}',
                        style: kContentTextWhite,
                      ),
                      Row(
                        children: [
                          Text(
                            'สถานะ  ',
                            style: kContentTextWhite,
                          ),
                          Text(
                            stockProduct.getStatus(),
                            style: stockProduct.getStatusTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz_outlined,color: Colors.white,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
