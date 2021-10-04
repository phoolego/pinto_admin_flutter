
import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
// import 'package:pinto_farmer_flutter/screen/farmer_product_sale_Page.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class SideMenu extends StatelessWidget {

String? firstName = '';
String? lastName = '';
String? role = '';

SideMenu.withoutAny(){
  this.firstName = 'Firstname';
  this.lastName = 'Lastname';
  this.role = 'Role';
}
SideMenu({this.firstName, this.lastName, this.role});



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Text(
                      '$firstName \n$lastName \n$role',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('จัดการคลังสินค้า',style: kContentTextStyle,),
              onTap: (){
                Navigator.pushNamed(context, '/stock',);
                print('จัดการคลังสินค้า');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('ตารางรับซื้อ',style: kContentTextStyle,),
              onTap: (){
                //Navigator.pop it will just close side menu
                print('ตารางรับซื้อ');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('ยืนยันการจ่ายเงินจากลูกค้า',style: kContentTextStyle),
              onTap: (){
               print('ยืนยันการจ่ายเงินจากลูกค้า');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('โปรไฟล์ของฉัน',style: kContentTextStyle),
              onTap: (){
                print('$firstName เข้าสู่หน้าโปรไฟล์ของฉัน',);
                Navigator.pushNamed(context, '/profile',);
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('StatusWithFarmer',style: kContentTextStyle),
              onTap: (){
                Navigator.pushNamed(context, '/stock/stockDashboard/farmDetail/SellingList/statusWithFarmer');
                print('StatusWithFarmer(DEMO)');
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('FarmProductPage',style: kContentTextStyle),
              onTap: (){
                Navigator.pushNamed(context, '/stock/stockDashboard/farmDetail/');
                print('FarmProductPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('sellingProductPage',style: kContentTextStyle),
              onTap: (){
                Navigator.pushNamed(context, '/stock/stockDashboard/farmDetail/SellingList');
                print('sellingProductPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ',style: kContentTextStyle),
              onTap: ()async {
                await Auth.logout();
                Navigator.pushReplacementNamed(context,'/');
              },
              // onPressed: () async {
              //   await Auth.logout();
              //   Navigator.pushReplacementNamed(context,'/');
              // },
            ),
          ],
        ),
      ),
    );
  }
}
