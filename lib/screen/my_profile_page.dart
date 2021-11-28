import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/component/side_menu.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('โปรไฟล์ของฉัน'),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text(
          'โปรไฟล์ของฉัน',
          style: kContentTextWhite,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0.1 * screenWidth, 0.02 * screenHeight, 0.1 * screenWidth, 0.02 * screenHeight),
          // decoration: BoxDecoration(color: deepWhite),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 90,
                      height: 90,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Expanded(
                      // width: 0.48 * screenWidth,
                      child: Text(
                        '${Auth.user.firstname} \n${Auth.user.lastname} \n${Auth.user.role}',
                        textAlign: TextAlign.left,
                        style: kHeadingTextStyle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile/edit');
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
              Text(
                'เบอร์โทรติดต่อ: ${Auth.user.contact}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'ที่อยู่: ${Auth.user.address}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
