import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

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
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    color: lightBlue,
                    child: Text(
                      'เกษตรกร',
                      style: kContentTextWhite,
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    child: Text(
                      'รอการยืนยัน',
                      style: kContentTextMedBlack,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
