import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
// import 'package:pinto_farmer_flutter/screen/farmer_product_sale_Page.dart';
import 'package:pinto_admin_flutter/service/auth.dart';


class SideMenu extends StatelessWidget {

String? firstName = '';
String? lastName = '';
String? role = '';
String currentPage='จัดการคลังสินค้า';

SideMenu.defaultMenu(String currentPage){
  this.firstName = Auth.user.firstname;
  this.lastName = Auth.user.lastname;
  this.role = Auth.user.role;
  this.currentPage = currentPage;
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
                if(currentPage=='จัดการคลังสินค้า'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/stock',);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.table_chart),
              title: Text('ตารางรับซื้อ',style: kContentTextStyle,),
              onTap: (){
                if(currentPage=='ตารางรับซื้อ'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/stock/productPriceTable');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('จัดการคำสั่งซื้อ',style: kContentTextStyle),
              onTap: (){
                if(currentPage=='จัดการคำสั่งซื้อ'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/order');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.list_outlined),
              title: Text('รายชื่อเกษตรกร',style: kContentTextStyle),
              onTap: (){
                if(currentPage=='รายชื่อเกษตรกร'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushNamed(context, '/manageFarmer');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('โปรไฟล์ของฉัน',style: kContentTextStyle),
              onTap: (){
                if(currentPage=='โปรไฟล์ของฉัน'){
                  Navigator.pop(context);
                }else{
                  Navigator.pushReplacementNamed(context, '/profile',);
                }
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.build),
            //   title: Text('StatusWithFarmer',style: kContentTextStyle),
            //   onTap: (){
            //     Navigator.pushNamed(context, '/stock/stockDashboard/farmDetail/SellingList/statusWithFarmer');
            //     print('StatusWithFarmer(DEMO)');
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.build),
            //   title: Text('sellingProductPage',style: kContentTextStyle),
            //   onTap: (){
            //     Navigator.pushNamed(context, '/stock/stockDashboard/farmDetail/SellingList');
            //     print('sellingProductPage');
            //   },
            // ),
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
