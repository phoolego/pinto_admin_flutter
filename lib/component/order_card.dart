import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/order.dart';

class OrderCard extends StatelessWidget {
  Order preOrder;
  var function;

  OrderCard({required this.preOrder, required this.function});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(screenWidth*0.1, 0, screenWidth*0.1, 10),
      child: InkWell(
        onTap: function,
        child: Container(
          alignment: AlignmentDirectional.center,
          height: screenHeight*0.17,
          width: screenWidth * 0.6,
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
                        const Text(
                          'ชื่อลูกค้า',
                          style: kContentTextWhite,
                        ),
                        Text(
                          '${preOrder.firstname} ${preOrder.lastname}',
                          style: kContentTextWhite,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'สถานะ: ',
                              style: kContentTextWhite,
                            ),
                            Text(
                              preOrder.getStatus(),
                              style: preOrder.getStatusTextStyle(),
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
      ),
    );
  }
}
