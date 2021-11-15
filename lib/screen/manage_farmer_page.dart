import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/row_price_table.dart';

class ManageFarmerPage extends StatefulWidget {
  @override
  _ManageFarmerPageState createState() => _ManageFarmerPageState();
}

class _ManageFarmerPageState extends State<ManageFarmerPage> {
  bool _isSelect = false;
  var colorTopNav;
  var TextStyleTopNav;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รายชื่อเกษตรกร',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSelect = true;
                      print(_isSelect);
                    });
                  },
                  child: !_isSelect
                      ? Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          color: lightBlue,
                          child: Text(
                            'เกษตรกร',
                            style: kContentTextWhite,
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          child: Text(
                            'เกษตรกร',
                            style: kContentTextMedBlack,
                          ),
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSelect = false;
                      print(_isSelect);
                    });
                  },
                  child: !_isSelect
                      ? Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          child: Text(
                            'รอการยืนยัน',
                            style: kContentTextMedBlack,
                          ),
                        )
                      : Container(
                          color: lightBlue,
                          alignment: Alignment.center,
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.08,
                          child: Text(
                            'รอการยืนยัน',
                            style: kContentTextWhite,
                          ),
                        ),
                ),
              ],
            ),
            _isSelect
                ? Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.05,
                        screenHeight * 0.05,
                        screenWidth * 0.05,
                        screenHeight * 0.05),
                    child: Column(
                      children: [
                        Container(
                          color: mediumBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 0.15 * screenWidth,
                                child: const Text(
                                  'ลำดับ',
                                  style: kContentTextWhite,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 0.35 * screenWidth,
                                child: const Text(
                                  'ชื่อเกษตร',
                                  style: kContentTextWhite,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight*0.65,
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                              farmerRow(index: 1, farmerName: 'farmerName'),
                            ],
                          )),
                        ),
                      ],
                    ))
                : Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.05,
                        screenHeight * 0.05,
                        screenWidth * 0.05,
                        screenHeight * 0.05),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: mediumBlue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 0.15 * screenWidth,
                                    child: const Text(
                                      'ลำดับ',
                                      style: kContentTextWhite,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.35 * screenWidth,
                                    child: const Text(
                                      'ชื่อ',
                                      style: kContentTextWhite,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.65,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                    confirmRow(
                                        index: 1, confirmName: 'confirmName'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class confirmRow extends StatelessWidget {
  int index;
  String confirmName;

  confirmRow({required this.index, required this.confirmName});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 0.15 * screenWidth,
              child: Text(
                '$index',
                style: kContentTextMedBlue,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.35 * screenWidth,
              child: Text(
                '$confirmName',
                style: kContentTextMedBlue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.01,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class farmerRow extends StatelessWidget {
  int index = 0;
  String? farmerName;

  farmerRow({required this.index, required this.farmerName});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
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
                      style: kContentTextMedBlue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 0.35 * screenWidth,
                    child: Text(
                      '$farmerName',
                      style: kContentTextMedBlue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              )
            ],
          ),
        ),
      ],
    );
  }
}
