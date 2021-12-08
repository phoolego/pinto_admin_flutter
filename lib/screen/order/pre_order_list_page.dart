import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pre_order_card.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/pre_order.dart';
import 'package:pinto_admin_flutter/screen/order/pre_order_detail_page.dart';
import 'package:pinto_admin_flutter/service/pre_order_service.dart';

class PreOrderListPage extends StatefulWidget {
  PreOrderListPage({Key? key}) : super(key: key);

  @override
  _PreOrderListPageState createState() => _PreOrderListPageState();
}

class _PreOrderListPageState extends State<PreOrderListPage> {
  String keyword = '';

  void reload(){
    setState(() {
      print('reload PreOrderListPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    Map operation = {
      'PreOrderListPage':reload
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รายการจองผลิตภัณฑ์',
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
              child: FutureBuilder<List<PreOrder>>(
                future: PreOrderService.getPreOrder(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<PreOrder>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<PreOrder> preOrderList = PreOrder.searchOperation(keyword, snapshot.data!);
                    return ListView.builder(
                      itemCount: preOrderList.length,
                      itemBuilder: (context, index) {
                        return PreOrderCard(
                            preOrder: preOrderList[index],
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    PreOrderDetailPage(
                                      preOrder:  preOrderList[index],
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
