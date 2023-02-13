import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors


import 'footer_desktop.dart';
import 'footer_mobile.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (width < 900) {
        return FooterMobile();
      } else {
        return FooterDesktop();
      }
    });
  }
}
