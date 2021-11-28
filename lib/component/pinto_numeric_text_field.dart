import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';

// ignore: must_be_immutable
class NumericWithDotTextField extends StatelessWidget {
  String label = '';
  var onChanged;
  NumericWithDotTextField({
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
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
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ));
  }
}