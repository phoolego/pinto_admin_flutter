import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/service/order_service.dart';

class TransactionReviewer extends StatelessWidget {
  int orderId;
  double totalPrice;
  String? picUrl;
  var operation;
  TransactionReviewer({
    Key? key,
    required this.orderId,
    required this.totalPrice,
    required this.picUrl,
    required this.operation
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'ตรวจสอบหลักฐานการชำระเงิน',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth*0.1, screenWidth*0.05, screenWidth*0.1, 0),
                  child: Text(
                    'จำนวนเงินที่ต้องการ: $totalPrice',
                    style: kContentTextStyle,
                  ),
              ),
              Container(
                margin: EdgeInsets.all(screenWidth*0.1),
                width: screenWidth*0.8,
                height: screenWidth*1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(picUrl!),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Center(
                  child: PintoButton(
                    label: 'ยืนยันหลักฐาน',
                    function: () async {
                      try{
                        await OrderService.validateOrder(orderId);
                        operation['OrderListPage']();
                        Navigator.popUntil(context, ModalRoute.withName('/order/order/paid'));
                      }catch(err){
                        print(err.toString());
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
