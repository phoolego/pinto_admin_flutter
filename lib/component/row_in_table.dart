import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class row_in_table extends StatelessWidget {
  int index;
  String name;
  double sellPrice;
  double buyPrice;
  String unit;



  row_in_table(
      {required this.index,
        required this.name,
        required this.buyPrice,
        required this.sellPrice,
        required this.unit});


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: mediumGrayBackground,
      child: Column(
        children: [
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
                  name,
                  style: kContentTextMedBlue,
                ),
              ),
              SizedBox(
                width: 0.15 * screenWidth,
                child: Text(
                  '$buyPrice',
                  style: kContentTextMedBlue,textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                width: 0.15 * screenWidth,
                child: Text(
                  '$sellPrice',
                  style: kContentTextMedBlue,textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                width: 0.2 * screenWidth,
                child: Text(
                  unit,
                  style: kContentTextMedBlue,textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight *0.01,)
        ],
      ),
    );
  }

}