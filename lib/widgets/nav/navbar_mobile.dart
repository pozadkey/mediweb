// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../buttons/navbar_button.dart';
import '../buttons/primary_button.dart';
import 'navbar_items.dart';
import 'navbar_logo.dart';

IconData myMenu = Icons.menu_rounded;
double collapsableHeight = 0.0;

class NavBarMobile extends StatefulWidget {
  NavBarMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarMobile> createState() => _NavBarMobileState();
}

class _NavBarMobileState extends State<NavBarMobile> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: Color.fromARGB(255, 1, 12, 85),
          alignment: Alignment.center,
          padding: width <= 420
              ? EdgeInsets.fromLTRB(10, 15, 10, 15)
              : EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavLogo(
                myColor: Colors.white,
                logoTextSize: width <= 340 ? 15 : 18,
                iconsSize: width <= 340 ? 15 : 18,
              ),
              NavBarButton(
                hamburgerSize: width <= 340 ? 15 : 30,
                onPressed: () {
                  if (_isVisible == false) {
                    setState(() {
                      _isVisible = true;
                      myMenu = FontAwesomeIcons.xmark;
                    });
                  } else if (_isVisible == true) {
                    setState(() {
                      _isVisible = false;
                      myMenu = FontAwesomeIcons.bars;
                    });
                  }
                },
                hamburgerColor: _isVisible == false
                    ? Colors.white
                    : Color.fromARGB(255, 213, 252, 121),
              )
            ],
          ),
        ),
        Visibility(
            visible: _isVisible,
            child: AnimatedContainer(
              color: Color.fromARGB(255, 1, 12, 85),
              padding: width <= 420
                  ? EdgeInsets.fromLTRB(20, 20, 20, 20)
                  : EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
              duration: Duration(milliseconds: 375),
              curve: Curves.easeInOut,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: width <= 420
                          ? EdgeInsets.fromLTRB(10, 15, 10, 15)
                          : EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NavBarItems(
                              onPressed: () {
                                setState(() {
                                  _isVisible = false;
                                  myMenu = FontAwesomeIcons.bars;
                                });
                                Navigator.pushNamed(context, '/');
                              },
                              title: 'Home',
                              initialColor: Colors.white,
                              hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                              hoverColorOut: Colors.white),
                          SizedBox(
                            height: 20.0,
                          ),
                          NavBarItems(
                              onPressed: () {
                                setState(() {
                                  _isVisible = false;
                                  myMenu = FontAwesomeIcons.bars;
                                });
                                Navigator.pushNamed(context, '/about');
                              },
                              title: 'About',
                              initialColor: Colors.white,
                              hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                              hoverColorOut: Colors.white),
                          SizedBox(
                            height: 20.0,
                          ),
                          NavBarItems(
                              onPressed: () {
                                setState(() {
                                  _isVisible = false;
                                  myMenu = FontAwesomeIcons.bars;
                                });
                                Navigator.pushNamed(context, '/login');
                              },
                              title: 'Doctors',
                              initialColor: Colors.white,
                              hoverColorIn: Color.fromARGB(255, 213, 252, 121),
                              hoverColorOut: Colors.white),
                          SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                              width: width <= 420 ? 200 : 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  PrimaryButton(
                                    title: 'Start Diagnosis',
                                    initalTextColor:
                                        Color.fromARGB(255, 1, 12, 85),
                                    initialBgColor: Colors.white,
                                    hoverInColor:
                                        Color.fromARGB(255, 1, 12, 85),
                                    hoverInBgColor:
                                        Color.fromARGB(255, 213, 252, 121),
                                    hoverOutColor:
                                        Color.fromARGB(255, 1, 12, 85),
                                    hoverOutBgColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = false;
                                        myMenu = FontAwesomeIcons.bars;
                                        Navigator.pushNamed(
                                            context, '/dashboard');
                                      });
                                    },
                                  ),
                                ],
                              ))
                        ],
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
