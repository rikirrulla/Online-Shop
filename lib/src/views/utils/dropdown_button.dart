import 'package:flutter/material.dart';
import 'package:online_shop/src/business_logic/utils/constants.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    Key key,
    this.title,
    this.item,
    this.valueChoose,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final String valueChoose;
  final List item;
  final Function onChanged;


  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {

  String valueChoose;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(
        widget.title,
        style: TextStyle(
          color: Colors.grey,
          fontFamily: font,
        ),
      ),
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 20,
      isExpanded: true,
      style: TextStyle(
        color: Colors.black,
        fontFamily: font,
        fontSize: 15.5,
      ),
      value: widget.valueChoose,
      onChanged: widget.onChanged,
      items: widget.item.map((valueItem) {
        return DropdownMenuItem(
          child: Text(valueItem),
          value: valueItem,
        );
      }).toList(),
    );
  }
}
