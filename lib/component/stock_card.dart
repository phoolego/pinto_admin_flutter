import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/stock_preview.dart';

class StockCard extends StatelessWidget {
  StockPreview stockPreview;
  var function;

  //not sure about img

  StockCard(
    {
      required this.stockPreview,
      required this.function
    }
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: SizedBox(
        // height: screenHeight*0.15,
        width: screenWidth*0.8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: stockPreview.pic!=null?Image.network(stockPreview.pic!,fit: BoxFit.cover,):
                      Image.asset('assets/images/Icons.jpg'),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stockPreview.name,
                            style: kHeadingTextStyle,
                          ),
                          Text(
                            'คลัง: ${stockPreview.preorderAmount+stockPreview.sellingAmount} ${stockPreview.unit}',
                            style: kContentTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.chevron_right),
                    ],
                  )
                )
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
