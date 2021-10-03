import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class ProductCard extends StatelessWidget {
  String productName = '';
  double inStock = 0;
  String? unit = '';
  int productId = 0;
  var function;

  //not sure about img

  ProductCard(
      {required this.productName,
      required this.inStock,
      required this.unit,
      required this.productId,
      required this.function});

  ProductCard.withoutProductID(
      {required this.productName,
      required this.unit,
      required this.inStock,
      required this.function});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        height: screenHeight*0.15,
        width: screenWidth*0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              height: screenHeight*0.12,
              width: screenWidth * 0.8,
              margin: EdgeInsets.fromLTRB(screenWidth*0.015, 0 , screenWidth*0.015, screenHeight*0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: deepBlue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName,
                                style: kContentTextWhite,
                              ),
                              Text(
                                'คลัง: ${inStock} ${unit}',
                                style: kContentTextWhite,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Text(' ')),
                  //sorry for lazy na ;-;
                  SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10, right: 10),
                          child: Icon(
                            Icons.more_horiz,
                            color: deepWhite,
                          )),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
