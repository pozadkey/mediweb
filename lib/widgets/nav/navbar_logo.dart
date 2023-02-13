// ignore_for_file: prefer_const_constructors, must_be_immutable, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavLogo extends StatefulWidget {
  final Color myColor;
  double iconsSize;
  double logoTextSize;

  NavLogo(
      {Key? key,
      required this.myColor,
      required this.iconsSize,
      required this.logoTextSize})
      : super(key: key);

  @override
  State<NavLogo> createState() => _NavLogoState();
}

class _NavLogoState extends State<NavLogo> {
  @override
  Widget build(BuildContext context) {
    final logoFont = TextStyle(
        fontSize: widget.logoTextSize,
        color: widget.myColor,
        letterSpacing: 1,
        fontWeight: FontWeight.w500);

    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: 0,
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.stethoscope,
            color: widget.myColor,
            size: widget.iconsSize,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Mediweb',
            style: logoFont,
          ),
        ],
      ),
    );
  }
}
