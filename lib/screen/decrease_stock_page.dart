import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/stock.dart';
import 'package:pinto_admin_flutter/service/stock_service.dart';

class DecreaseStockPage extends StatefulWidget {
  String productName = '';
  Map operation;
  DecreaseStockPage({
    required this.productName,
    required this.operation,
  });
  @override
  _DecreaseStockPageState createState() => _DecreaseStockPageState();
}

class _DecreaseStockPageState extends State<DecreaseStockPage> {

  double _decreaseAmount = 0;
  String _reason = '';
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: deepBlue,
          title: Text(
            widget.productName,
            style: kAppbarTextStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: FutureBuilder<Stock>(
        future: StockService.getStockDetail(widget.productName),
        builder: (BuildContext context, AsyncSnapshot<Stock> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Stock stock = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: mediumBlue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //SizedBox(height: 10,),
                      Text(
                        'คงเหลือในคลังทั้งหมด: ${stock.preorderAmount + stock.sellingAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      Text(
                        'จำนวนที่วางขาย: ${stock.sellingAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      Text(
                        'จำนวนที่เปิดจอง: ${stock.preorderAmount} ${stock.unit}',
                        style: kContentTextWhite,
                      ),
                      //SizedBox(height: 10,),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 30, top: 20, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'ยอดสั่งซื้อ: ',
                                    style: kContentTextMedBlack,
                                  ),
                                  Text(
                                    '${stock.customerSales} ${stock.unit}',
                                    style: kContentTextMedBlack,
                                  )
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'ยอดการจอง: ',
                                  style: kContentTextMedBlack,
                                ),
                                Text(
                                  '${stock.customerProOrder} ${stock.unit}',
                                  style: kContentTextMedBlack,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('ปริมาณที่ต้องการลด',
                                    style: kNormalTextStyle),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'กรุณากรอกปริมาณที่ต้องการลด';
                                    } else if (num.tryParse(value) == null ||
                                        double.parse(value) <= 0) {
                                      return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (num.tryParse(value) != null &&
                                        double.parse(value) > 0) {
                                      _decreaseAmount = double.parse(value);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('สาเหตุ', style: kNormalTextStyle),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'กรุณากรอกสาเหตุ'; //todo dropdown
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val){
                                    _reason = val;
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: PintoButton(
                                width: 200,
                                label: 'ยืนยันการลดจำนวน',
                                buttonColor: deepBlue,
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _errorMessage = '';
                                    });
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('ยืนยังการหักจำนวน',
                                            style: kHeadingTextStyle),
                                        content: const Text(
                                            'โปรดยืนยันว่าท่านกรอกตัวเลขถูกต้อง',
                                            style: kContentTextStyle),
                                        actions: <Widget>[
                                          TextButton(
                                              child: const Text(
                                                'ยกเลิก',
                                                style: kContentTextStyle,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                          TextButton(
                                            child: const Text(
                                              'ยืนยัน',
                                              style: kContentTextStyle,
                                            ),
                                            onPressed: () async{
                                              try{
                                                await StockService.disposeStock(stock.name, _decreaseAmount, _reason);
                                                widget.operation['StockDashboardPage']();
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }catch(err){
                                                setState(() {
                                                  _errorMessage = err.toString();
                                                  Navigator.pop(context);
                                                });
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                            ),
                          ),
                          Center(child:Text(_errorMessage,style: const TextStyle(color: Colors.red),)),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            );
          }
        },
      ),
    );
  }
}
