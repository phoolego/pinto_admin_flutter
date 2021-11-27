import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class PintoButton extends StatelessWidget {
  double width;
  String label = '';
  var function;
  Color buttonColor = deepBlue;
  TextStyle textStyle=whiteSmallNormalTextStyle;


  PintoButton(
      {this.width=200,
      required this.label,
      required this.function,
      this.buttonColor=deepBlue,
      this.textStyle=whiteSmallNormalTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
