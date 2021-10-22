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
                  onTap: (){
                    setState(() {
                      _isSelect = true;
                      print(_isSelect);
                    });
                  },
                  child: !_isSelect ? Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    color: lightBlue,
                    child: Text(
                      'เกษตรกร',
                      style: kContentTextWhite,
                    ),
                  ): Container(
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
                  onTap: (){
                    setState(() {
                      _isSelect = false;
                      print(_isSelect);
                    });
                  },
                  child: !_isSelect ? Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.08,
                    child: Text(
                      'รอการยืนยัน',
                      style: kContentTextMedBlack,
                    ),
                  ): Container(
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
            !_isSelect? Container(
              child: (Text('รอยืนยัน')),
            ):Container(
              child: (
              Text('เกษตรกร')
              ),
            )
          ],
        ),
      ),
    );
  }
}
