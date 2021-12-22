import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/order_card.dart';
import 'package:pinto_admin_flutter/component/pre_order_card.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/order.dart';
import 'package:pinto_admin_flutter/model/pre_order.dart';
import 'package:pinto_admin_flutter/screen/order/order_detail_page.dart';
import 'package:pinto_admin_flutter/screen/order/pre_order_detail_page.dart';
import 'package:pinto_admin_flutter/service/order_service.dart';
import 'package:pinto_admin_flutter/service/pre_order_service.dart';

class OrderListPage extends StatefulWidget {
  String statusFilter;
  OrderListPage({Key? key, required this.statusFilter}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  String keyword = '';

  void reload(){
    setState(() {
      print('reload OrderWaitListPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    Map operation = {
      'OrderListPage':reload
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รายการสั่งซื้อผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                textAlign: TextAlign.left,
                style: kHeadingTextStyle,
                decoration: const InputDecoration(
                  hintText: 'ค้นหา',
                  hintStyle: kNormalTextStyle,
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    keyword = val;
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Order>>(
                future: OrderService.getOrder(widget.statusFilter),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Order>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Order> orderList = Order.searchOperation(keyword, snapshot.data!);
                    return ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        return OrderCard(
                            preOrder: orderList[index],
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    OrderDetailPage(
                                      order: orderList[index],
                                      operation: operation,
                                    )
                                  )
                              );
                            }
                        );
                      }

                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
