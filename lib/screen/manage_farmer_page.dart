import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/farmer.dart';
import 'package:pinto_admin_flutter/screen/manage_farmer_detail_page.dart';
import 'package:pinto_admin_flutter/service/farmer_service.dart';

class ManageFarmerPage extends StatefulWidget {
  @override
  _ManageFarmerPageState createState() => _ManageFarmerPageState();
}

class _ManageFarmerPageState extends State<ManageFarmerPage> {
  int tapPage = 1;
  var colorTopNav;
  var TextStyleTopNav;

  Widget farmerTap(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
        child: Column(
          children: [
            Container(
              color: mediumBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 0.2 * screenWidth,
                    child: const Text(
                      'ลำดับ',
                      style: kContentTextWhite,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 0.8 * screenWidth,
                    child: const Text(
                      'ชื่อเกษตร',
                      style: kContentTextWhite,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight*0.65,
              child: FutureBuilder<List<Farmer>>(
                future: FarmerService.getFarmer(),
                builder: (BuildContext context, AsyncSnapshot<List<Farmer>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Farmer> farmer = snapshot.data!;
                    return ListView.builder(
                        itemCount: farmer.length,
                        itemBuilder: (context, index) => FarmerRow(
                          index: index + 1,
                          farmer: farmer[index],
                        )
                    );
                  }
                },
              ),
            ),
          ],
        )
    );
  }
  Widget confirmTap(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.05),
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
                        width: 0.2 * screenWidth,
                        child: const Text(
                          'ลำดับ',
                          style: kContentTextWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 0.8 * screenWidth,
                        child: const Text(
                          'ชื่อ',
                          style: kContentTextWhite,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.65,
                  child: FutureBuilder<List<Farmer>>(
                    future: FarmerService.getFarmerRequest(),
                    builder: (BuildContext context, AsyncSnapshot<List<Farmer>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<Farmer> farmer = snapshot.data!;
                        return ListView.builder(
                            itemCount: farmer.length,
                            itemBuilder: (context, index) => ConfirmRow(
                              index: index + 1,
                              farmer: farmer[index],
                            )
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  Widget tapSelected(BuildContext context,int page){
    switch(page){
      case 1:
        return farmerTap(context);
      case 2:
        return confirmTap(context);
      default:
        return farmerTap(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('รายชื่อเกษตรกร'),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'รายชื่อเกษตรกร',
          style: kAppbarTextStyle,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  if(tapPage!=1){
                    setState(() {
                      tapPage = 1;
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.08,
                  color: tapPage==1?deepWhite:lightBlue,
                  child: Text(
                    'เกษตรกร',
                    style: tapPage==1?kContentTextMedBlack:kContentTextWhite,
                  ),
                )
              ),
              InkWell(
                onTap: () {
                  if(tapPage!=2){
                    setState(() {
                      tapPage = 2;
                    });
                  }
                },
                child: Container(
                  color: tapPage==2?deepWhite:lightBlue,
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.08,
                  child: Text(
                    'รอการยืนยัน',
                    style: tapPage==2?kContentTextMedBlack:kContentTextWhite,
                  ),
                ),
              ),
            ],
          ),
          tapSelected(context,tapPage),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ConfirmRow extends StatelessWidget {
  int index;
  Farmer farmer;

  ConfirmRow({required this.index, required this.farmer});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ManageFarmerDetailtPage(farmer: farmer,isRequest: true))
        );
      },
      child: Container(
        color: mediumGrayBackground,
        child: Column(
          children: [
            SizedBox(height: screenHeight *0.01),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 0.2 * screenWidth,
                  child: Text(
                    '$index',
                    style: kContentTextMedBlue,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 0.8 * screenWidth,
                  child: Text(
                    '${farmer.firstname} ${farmer.lastname}',
                    style: kContentTextMedBlue,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight *0.01),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FarmerRow extends StatelessWidget {
  int index = 0;
  Farmer farmer;

  FarmerRow({required this.index, required this.farmer});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ManageFarmerDetailtPage(farmer: farmer,isRequest: false))
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: mediumGrayBackground,
            child: Column(
              children: [
                SizedBox(height: screenHeight *0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 0.20 * screenWidth,
                      child: Text(
                        '$index',
                        style: kContentTextMedBlue,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.80 * screenWidth,
                      child: Text(
                        '${farmer.firstname} ${farmer.lastname}',
                        style: kContentTextMedBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
