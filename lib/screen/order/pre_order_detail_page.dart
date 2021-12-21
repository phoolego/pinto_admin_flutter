import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/pre_order.dart';
import 'package:pinto_admin_flutter/service/date_format.dart';

class PreOrderDetailPage extends StatelessWidget {
  PreOrder preOrder;
  var operation;
  PreOrderDetailPage({Key? key,required this.preOrder,required this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'การสั่งจอง',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: mediumBlue,
                borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ชื่อผู้ใช้: ${preOrder.firstname} ${preOrder.lastname}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'เบอร์โทรติดต่อ: ${preOrder.contact}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'E-mail: ${preOrder.email}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'ที่อยู่: ${preOrder.address}',
                    style: kContentTextWhite,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ผลิตภัณฑ์: ${preOrder.productType} ${preOrder.amount} ${preOrder.unit}',style: kContentTextStyle),
                  Text('วันที่ต้องจัดหาผลิตภัณฑ์: ${DateFormat.getFullDate(preOrder.sellingDate!)}',style: kContentTextStyle)
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
