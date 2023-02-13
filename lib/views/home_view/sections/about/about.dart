// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'about_desktop.dart';
import 'about_mobile.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (width < 700) {
        return AboutMobile();
      } else {
        return AboutDesktop();
      }
    });
  }
}
