import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class FarmInfoCard extends StatelessWidget {
  String farmName = '';
  double inFarm = 0;
  String? unit = '';
  int farmId = 0;
  var function;

  //not sure about img

  FarmInfoCard(
      {required this.farmName,
        required this.inFarm,
        required this.unit,
        required this.farmId,
        required this.function});

  FarmInfoCard.withoutProductID(
      {required this.farmName,
        required this.unit,
        required this.inFarm,
        required this.function});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: screenHeight*0.17,
        width: screenWidth * 0.6,
        margin: EdgeInsets.fromLTRB(screenWidth*0.1, 0, screenWidth*0.1, 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: mediumBlue,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        farmName,
                        style: kContentTextWhite,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'คลัง: ${inFarm} ',
                            style: kContentTextWhite,
                          ),
                          Text(
                            '${unit}',
                            style: kContentTextWhite,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, right: 20),
                      child: const Icon(
                        Icons.more_horiz,
                        color: deepWhite,
                      )
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
