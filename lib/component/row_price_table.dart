import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/product_type.dart';
import 'package:pinto_admin_flutter/screen/product_edit.dart';

class RowPriceTable extends StatelessWidget {
  int index;
  ProductType product;

  RowPriceTable({required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminEditProductPage(
              product: product,
            ))
        );
      },
      child: Container(
        color: mediumGrayBackground,
        child: Column(
          children: [
            SizedBox(height: screenHeight *0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 0.15 * screenWidth,
                  child: Text(
                    '$index',
                    style: kContentTextMedBlue,textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 0.35 * screenWidth,
                  child: Text(
                    product.name,
                    style: kContentTextMedBlue,
                  ),
                ),
                SizedBox(
                  width: 0.15 * screenWidth,
                  child: Text(
                    product.priceBuy.toString(),
                    style: kContentTextMedBlue,textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 0.15 * screenWidth,
                  child: Text(
                    product.priceSell.toString(),
                    style: kContentTextMedBlue,textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 0.2 * screenWidth,
                  child: Text(
                    product.unit,
                    style: kContentTextMedBlue,textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight *0.01,)
          ],
        ),
      ),
    );
  }

}