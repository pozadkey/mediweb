// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  final String title;
  Color initalTextColor;
  Color initialBgColor;
  Color hoverInColor;
  Color hoverInBgColor;
  Color hoverOutColor;
  Color hoverOutBgColor;
  final Function onPressed;

  SelectButton(
      {Key? key,
      required this.title,
      required this.initalTextColor,
      required this.initialBgColor,
      required this.hoverInColor,
      required this.hoverInBgColor,
      required this.hoverOutColor,
      required this.hoverOutBgColor,
      required this.onPressed})
      : super(key: key);

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final selectButtonFont = TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: width >= 700 ? 16 : 14,
        color: widget.initalTextColor,
        fontWeight: FontWeight.w500);

    return MouseRegion(
      onEnter: (m) {
        setState(() {
          widget.initalTextColor = widget.hoverInColor;
          widget.initialBgColor = widget.hoverInBgColor;
        });
      },
      onExit: (m) {
        setState(() {
          widget.initalTextColor = widget.hoverOutColor;
          widget.initialBgColor = widget.hoverOutBgColor;
        });
      },
      child: TextButton(
        child: Padding(
          padding: width >= 800 ? EdgeInsets.all(8) : EdgeInsets.all(6),
          child: Text(
            widget.title,
            style: selectButtonFont,
          ),
        ),
        onPressed: () {
          setState(() {
            widget.initalTextColor = widget.hoverInColor;
            widget.initialBgColor = widget.hoverInColor;
          });
          widget.onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor: widget.initialBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
        ),
      ),
    );
  }
}
