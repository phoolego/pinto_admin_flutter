import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class ProductCard extends StatelessWidget {

  String productName = '';
  String dateString = '';
  int productId = 0;
  var function;

  //not sure about img

  ProductCard({
    required this.productName,
    required this.dateString,
    required this.productId,
    required this.function});

  ProductCard.withoutProductID({
    required this.productName,
    required this.dateString,
    required this.function});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 100,
        width: 500,
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset('assets/images/Icons.jpg'),
                    //TODO- fix image to dynamic
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: kHeadingTextStyle,
                        ),
                        Text(
                          'Date: ${dateString}',
                          style: kContentTextStyle,
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
                          Container(child: Icon(Icons.chevron_right)),
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
