// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mediweb/widgets/buttons/primary_button.dart';

class IntroDesktop extends StatefulWidget {
  const IntroDesktop({Key? key}) : super(key: key);

  @override
  State<IntroDesktop> createState() => _IntroDesktopState();
}

class _IntroDesktopState extends State<IntroDesktop> {
  final _headerFont = TextStyle(
      fontSize: 100,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5);

  final _introFont = TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 202, 205, 212),
      fontWeight: FontWeight.w400,
      height: 2,
      letterSpacing: 0.6);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 1, 12, 85),
        child: Column(
          children: [
            Container(
                padding: width <= 1550
                    ? EdgeInsets.fromLTRB(100, 40, 100, 40)
                    : EdgeInsets.fromLTRB(250, 40, 250, 40),
                width: 2000,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 500,
                          child: FittedBox(
                              child: Text(
                            'Know About Your\nHealth.',
                            style: _headerFont,
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 500,
                          child: Text(
                            'When medical symptoms appear, Mediweb helps you understand what might be the cause. Just share a few details about your symptoms and some basic health info, and we’ll show you a list of the most likely diagnoses.',
                            style: _introFont,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryButton(
                              title: 'Start Diagnosis',
                              initalTextColor: Colors.black,
                              initialBgColor: Colors.white,
                              hoverInColor: Colors.black,
                              hoverInBgColor:
                                  Color.fromARGB(255, 213, 252, 121),
                              hoverOutColor: Colors.black,
                              hoverOutBgColor: Colors.white,
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/dashboard'),
                            ),
                          ],
                        )
                      ],
                    )),
                    Expanded(
                        child: Image.asset(
                      'assets/images/medical.png',
                      scale: 1.2,
                    ))
                  ],
                )),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
