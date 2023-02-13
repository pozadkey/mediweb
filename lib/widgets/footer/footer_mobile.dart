// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../nav/navbar_items.dart';

class FooterMobile extends StatefulWidget {
  const FooterMobile({Key? key}) : super(key: key);

  @override
  State<FooterMobile> createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  void _launchPortfolio() async {
    final url = Uri.parse('https://pozadkey.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('y').format(now);

    return Container(
      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
      color: Color.fromARGB(255, 1, 12, 85),
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                NavBarItems(
                    onPressed: () {},
                    title: 'Designed & Developed by -',
                    initialColor: Color.fromARGB(255, 214, 214, 214),
                    hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                    hoverColorOut: Color.fromARGB(255, 214, 214, 214)),
                SizedBox(
                  width: 10,
                ),
                NavBarItems(
                    onPressed: _launchPortfolio,
                    title: 'Damilare Ajakaiye',
                    initialColor: Colors.white,
                    hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                    hoverColorOut: Colors.white),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FittedBox(
            child: SizedBox(
              child: Row(
                children: [
                  NavBarItems(
                    onPressed: () {},
                    title: '© $formattedDate. Mediweb',
                    initialColor: Colors.white,
                    hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                    hoverColorOut: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
