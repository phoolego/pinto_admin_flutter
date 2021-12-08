import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/constant.dart';

class OrderDashBoard extends StatelessWidget {
  const OrderDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu.defaultMenu('จัดการคำสั่งซื้อ'),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'จัดการคำสั่งซื้อ',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 20,bottom: 10),
          children: [
            ChoiceCard(
              label: 'รายการจองผลิตภัณฑ์',
              function: (){
                Navigator.pushNamed(context, '/order/preOrder');
              },
            ),
            ChoiceCard(
              label: 'รายการสั่งซื้อรอการชำระเงิน',
              function: (){
                Navigator.pushNamed(context, '/order/order/wait');
              },
            ),
            ChoiceCard(
              label: 'รายการสั่งซื้อรอการตรวจสอบการชำระเงิน',
              function: (){
                Navigator.pushNamed(context, '/order/order/paid');
              },
            ),
            ChoiceCard(
              label: 'รายการสั่งซื้อรอการจัดส่ง',
              function: (){
                Navigator.pushNamed(context, '/order/order/validate');
              },
            ),
            ChoiceCard(
              label: 'รายการสั่งที่เสร็จสิ้นลงแล้ว',
              function: (){
                Navigator.pushNamed(context, '/order/order/complete');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  String label = '';
  var function;

  ChoiceCard(
      {required this.label,
        required this.function});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(screenWidth*0.1, 0, screenWidth*0.1, 10),
      child: InkWell(
        onTap: function,
        child: Container(
          alignment: AlignmentDirectional.center,
          height: screenHeight*0.17,
          width: screenWidth * 0.6,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: mediumBlue,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth*0.6,
                child: Text(
                  label,
                  style: kContentTextWhite,
                  softWrap: true,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: deepWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
