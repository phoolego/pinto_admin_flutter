import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:pinto_admin_flutter/constant.dart';

class DropDown extends StatelessWidget {
  String? headingLabel = '';
  List<String>? items = [];
  String? hintText = '';
  var func;

  DropDown.sendStockProduct(this.func) {
    headingLabel = 'ตัวกรอง';
    items = [
      "ทั้งหมด",
      "ยังไม่ได้รับผลิตภัณฑ์",
      "ได้รับผลิตภัณฑ์แล้ว",
      "ชำระเงินแล้ว",
    ];
    hintText = "กรองสถานะรายการ";
  }

  DropDown({this.hintText, this.items, this.headingLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownSearch<String>(
        mode: Mode.MENU,
        items: items,
        label: headingLabel,
        dropdownSearchBaseStyle: kContentTextStyle,
        hint: hintText,
        popupItemDisabled: (String s) => s.startsWith('I'),
        onChanged: func,
        selectedItem: items![0],
      ),
    );
  }
}
