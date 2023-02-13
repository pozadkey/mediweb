// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../buttons/primary_button.dart';
import 'navbar_items.dart';
import 'navbar_logo.dart';

class NavBarDesktop extends StatefulWidget {
  const NavBarDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarDesktop> createState() => _NavBarDesktopState();
}


class _NavBarDesktopState extends State<NavBarDesktop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Color.fromARGB(255, 1, 12, 85),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: width <= 1550
                ? EdgeInsets.fromLTRB(50, 20, 50, 20)
                : EdgeInsets.fromLTRB(200, 20, 200, 20),
            width: 2000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavLogo(
                  myColor: Colors.white,
                  logoTextSize: 18,
                  iconsSize: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavBarItems(
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        title: 'Home',
                        initialColor: Colors.white,
                        hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                        hoverColorOut: Colors.white),
                    SizedBox(
                      width: 15,
                    ),
                    
                    SizedBox(
                      width: 25,
                    ),
                    PrimaryButton(
                      title: 'Run Diagnosis',
                      initalTextColor: Color.fromARGB(255, 1, 12, 85),
                      initialBgColor: Colors.white,
                      hoverInColor: Color.fromARGB(255, 1, 12, 85),
                      hoverInBgColor: Color.fromARGB(255, 213, 252, 121),
                      hoverOutColor: Color.fromARGB(255, 1, 12, 85),
                      hoverOutBgColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
