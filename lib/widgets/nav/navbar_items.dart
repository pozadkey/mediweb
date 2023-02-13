// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

class NavBarItems extends StatefulWidget {
  String title;
  Color initialColor;
  Color hoverColorIn;
  Color hoverColorOut;
  final Function onPressed;

  NavBarItems(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.initialColor,
      required this.hoverColorIn,
      required this.hoverColorOut})
      : super(key: key);

  @override
  _NavBarItemsState createState() => _NavBarItemsState();
}

class _NavBarItemsState extends State<NavBarItems> {
  @override
  Widget build(BuildContext context) {
    final navFont = TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.5,
        color: widget.initialColor,
        fontWeight: FontWeight.w500);

    return MouseRegion(
        onEnter: (m) {
          setState(() {
            widget.initialColor = widget.hoverColorIn;
          });
        },
        onExit: (m) {
          setState(() {
            widget.initialColor = widget.hoverColorOut;
          });
        },
        child: MaterialButton(
          padding: EdgeInsets.zero,
          minWidth: 0,
          onPressed: () {
            widget.onPressed();
          },
          child: Text(
            widget.title,
            style: navFont,
          ),
        ));
  }
}
