import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/component/pinto_button.dart';
import 'package:pinto_admin_flutter/constant.dart';
import 'package:pinto_admin_flutter/model/farmer.dart';
import 'package:pinto_admin_flutter/service/farmer_service.dart';

class ManageFarmerDetailtPage extends StatelessWidget {
  Farmer farmer;
  bool isRequest;

  ManageFarmerDetailtPage({required this.farmer,required this.isRequest});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: const Text(
          'ข้อมูลเกษตกร',
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
                        '${farmer.firstname} \n${farmer.lastname} \n${farmer.getRole()}',
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
                'ชื่อฟาร์ม: ${farmer.farmName}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'พื้นที่ฟาร์มทั้งหมด: ${farmer.maxArea} ตร.ม.',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'เบอร์โทรติดต่อ: ${farmer.contact}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'ที่อยู่: ${farmer.address}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              SizedBox(height: screenHeight*0.01,),
              isRequest?
                Center(
                  child: PintoButton(
                    label: 'ให้สิทธิ์เกษตกร',
                    function: (){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text('คำเตือน',
                                style: kHeadingTextStyle),
                            content: const Text(
                                'ยืนยันการให้สิทธิ์',
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
                                onPressed: () async {
                                  try{
                                    await FarmerService.approveFarmer(farmer.userId);
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(context, '/manageFarmer');
                                  }catch(err){
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            ],
                          ),
                      );
                    },
                  ),
                ):
                const SizedBox(),
              SizedBox(height: screenHeight*0.01,),
              isRequest?
              Center(
                child: PintoButton(
                  label: 'ไม่อนุมัติสิทธิ์',
                  buttonColor: notYetRed,
                  function: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                        AlertDialog(
                          title: const Text('คำเตือน',
                              style: kHeadingTextStyle),
                          content: const Text(
                              'ยืนยันการไม่อนุมัติสิทธิ์',
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
                              onPressed: () async {
                                try{
                                  await FarmerService.rejectFarmer(farmer.userId);
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(context, '/manageFarmer');
                                }catch(err){
                                  Navigator.pop(context);
                                }
                              },
                            )
                          ],
                        ),
                    );
                  },
                ),
              ):
              const SizedBox(),
              farmer.role=='ADMIN'?
              Center(
                child: PintoButton(
                  label: 'ลดสิทธิ์เป็นเกษตกร',
                  function: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text('คำเตือน',
                                style: kHeadingTextStyle),
                            content: const Text(
                                'ยืนยันการลดสิทธิ์ผู้ใช้จากผู้ดูแลระบบเป็นเกษตกร',
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
                                onPressed: () async {
                                  try{
                                    await FarmerService.setToFarmer(farmer.userId);
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(context, '/manageFarmer');
                                  }catch(err){
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            ],
                          ),
                    );
                  },
                ),
              ):
              const SizedBox(),
              farmer.role=='FARMER'?
              Center(
                child: PintoButton(
                  label: 'ให้สิทธิ์เป็นผูดูแลระบบ',
                  function: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            title: const Text('คำเตือน',
                                style: kHeadingTextStyle),
                            content: const Text(
                                'ยืนยันการให้สิทธิ์จากเกษตกรเป็นผูดูแลระบบ',
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
                                onPressed: () async {
                                  try{
                                    await FarmerService.gainAdminRole(farmer.userId);
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(context, '/manageFarmer');
                                  }catch(err){
                                    Navigator.pop(context);
                                  }
                                },
                              )
                            ],
                          ),
                    );
                  },
                ),
              ):
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
