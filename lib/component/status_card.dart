import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class StatusCard extends StatelessWidget {

  String sendingProductDate = '';
  String status = '';
  var function;

  StatusCard({required this.sendingProductDate,required this.status, required this.function});
  StatusCard.withoutAny({var function}){
    this.sendingProductDate = '11/09/2021';
    this.status = 'ยังไม่ส่งผลผลิต';
    this.function = function;

}


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: screenHeight * 0.20,
        width: screenWidth * 0.1,
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: mediumBlue,
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'รายการส่งขายวันที่:\n$sendingProductDate',
                            style: kContentTextWhite,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'สถานะ    ',
                              style: kContentTextWhite,
                            ),
                            Text(
                              status,
                              style: kContentTextWhite,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Expanded(child: Text(' ')),
                  //sorry for lazy na ;-;
                  SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(child: Icon(Icons.more_horiz_outlined,color: Colors.white,),),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
