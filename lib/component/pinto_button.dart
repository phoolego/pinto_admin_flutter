import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

class PintoButton extends StatelessWidget {
  double? width;
  String label = '';
  var function;
  Color? buttonColor = Colors.amber;
  IconData? icon;


  PintoButton(
      {this.width,
      required this.label,
      required this.function,
      required this.buttonColor,
      this.icon});

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
                style: whiteSmallNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
