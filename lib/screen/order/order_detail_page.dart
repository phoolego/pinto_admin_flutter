import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/order.dart';
import 'package:pinto_admin_flutter/model/pre_order.dart';
import 'package:pinto_admin_flutter/screen/order/transaction_reviewer.dart';
import 'package:pinto_admin_flutter/service/date_format.dart';
import 'package:pinto_admin_flutter/service/order_service.dart';

class OrderDetailPage extends StatelessWidget {
  Order order;
  var operation;
  OrderDetailPage({Key? key,required this.order,required this.operation}) : super(key: key);

  Widget getButton(String status,BuildContext context,double totalPrice){
    if(status=='WAIT'){
      return SizedBox();
    }else if(status=='PAID'){
      return PintoButton(
        label: 'ตรวจสอบหลักฐาน',
        function: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionReviewer(
              operation: operation,
              totalPrice: totalPrice,
              picUrl: order.tranPic,
              orderId: order.orderId,
            ))
          );
        }
      );
    }else if(status=='VALIDATE'){
      return PintoButton(
          label: 'ยืนยันการจัดส่ง',
          function: () async {
            try{
              await OrderService.completeOrder(order.orderId);
              operation['OrderListPage']();
              Navigator.pop(context);
            }catch(err){
              print(err.toString());
            }
          }
      );
    }else if(status=='COMPLETE'){
      return SizedBox();
    }else{
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for(int i=0 ; i<order.orderItems.length ; i++){
      totalPrice+=order.orderItems[i].price;
    }
    totalPrice+=order.deliveryPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รอชำระเงิน',
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
                    'ชื่อผู้ใช้: ${order.firstname} ${order.lastname}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'เบอร์โทรติดต่อ: ${order.contact}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'E-mail: ${order.email}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'ที่อยู่: ${order.address}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'ประเภทการส่ง: ${order.deliveryType}',
                    style: kContentTextWhite,
                  ),
                  Text(
                    'สถานะ: ${order.getStatus()}',
                    style: order.getStatusTextStyle(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: order.orderItems.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.orderItems[index].productType,style: kContentTextStyle),
                              Text('${order.orderItems[index].amount} ${order.orderItems[index].unit}',style: kContentTextMedBlack),
                            ],
                          ),
                          Text('${order.orderItems[index].price} บาท',style: kContentTextStyle),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      )
                    ],
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ค่าจัดส่ง',style: kContentTextStyle),
                  Text('${order.deliveryPrice} บาท',style: kContentTextStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ทั้งหมด',style: kContentTextStyle),
                  Text('$totalPrice บาท',style: kContentTextStyle),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Center(child: getButton(order.status,context,totalPrice)),
            )
          ]
        )
      )
    );
  }
}
