// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  Icon icon;
  Color initialColor;
  Color hoverInColor;
  Color hoverOutColor;
  final Function onPressed;

  MyIconButton(
      {Key? key,
      required this.icon,
      required this.initialColor,
      required this.hoverInColor,
      required this.hoverOutColor,
      required this.onPressed})
      : super(key: key);

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (m) {
        setState(() {
          widget.initialColor = widget.hoverInColor;
        });
      },
      onExit: (m) {
        setState(() {
          widget.initialColor = widget.hoverOutColor;
        });
      },
      child: IconButton(
          padding: EdgeInsets.zero,
          icon: widget.icon,
          color: widget.initialColor,
          iconSize: 20,
          onPressed: () {
            widget.onPressed();
          }),
    );
  }
}
