import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

// ignore: must_be_immutable
class PintoTextFieldWithoutHintText extends StatelessWidget {
  String label = '';
  var validator;
  var onChanged;
  int? min;
  int? max;

  PintoTextFieldWithoutHintText(
      {required this.label, this.validator, this.onChanged, this.max, this.min});

  PintoTextFieldWithoutHintText.withoutAny() {
    this.label = 'อีเมล';
    this.validator = (String val) {};
    this.onChanged = (String val) {};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: kContentTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              decoration: const InputDecoration(
                // hasFloatingPlaceholder: true,
                // hintText: 'gdsagasdg',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}