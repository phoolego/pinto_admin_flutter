import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';

class MyProfilePage extends StatelessWidget {
  String? firstName = SideMenu.withoutAny().firstName;
  String? lastName = SideMenu.withoutAny().lastName;
  String? role = SideMenu.withoutAny().role;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.withoutAny(),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'โปรไฟล์ของฉัน',
          style: whiteSmallNormalTextStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0.1 * screenWidth, 0.02 * screenHeight, 0.1 * screenWidth, 0.02 * screenHeight),
          // decoration: BoxDecoration(color: deepWhite),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 90,
                      height: 90,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Container(
                      width: 0.4 * screenWidth,
                      child: Text(
                        '$firstName \n$lastName \n$role',
                        textAlign: TextAlign.left,
                        style: kHeadingTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('$firstName เข้าสู่หน้าแก้ไขโปรไฟล์ของฉัน');
                        Navigator.defaultRouteName;
                        //TODO:My edit profile page
                      },
                      icon: Icon(Icons.edit),),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
