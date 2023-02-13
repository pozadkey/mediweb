// ignore_for_file: prefer_const_constructors, unused_field, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../nav/navbar_items.dart';

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({Key? key}) : super(key: key);

  @override
  State<FooterDesktop> createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
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
      width: 2000,
      padding: EdgeInsets.fromLTRB(200, 20, 200, 20),
      color: Color.fromARGB(255, 1, 12, 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarItems(
              onPressed: () {},
              title: '© $formattedDate. Mediweb',
              initialColor: Colors.white,
              hoverColorIn: Color.fromARGB(255, 213, 252, 121),
              hoverColorOut: Colors.white,),
          Row(
            children: [
              NavBarItems(
                  onPressed: () {},
                  title: 'Designed & Developed by -',
                  initialColor: Color.fromARGB(255, 214, 214, 214),
                  hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                  hoverColorOut: Color.fromARGB(255, 214, 214, 214)),
              SizedBox(
                width: 5,
              ),
              NavBarItems(
                  onPressed: _launchPortfolio,
                  title: 'Damilare Ajakaiye',
                  initialColor: Colors.white,
                  hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                  hoverColorOut: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
