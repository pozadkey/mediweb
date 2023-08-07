// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../../../widgets/buttons/primary_button.dart';

class IntroMobile extends StatefulWidget {
  const IntroMobile({Key? key}) : super(key: key);

  @override
  State<IntroMobile> createState() => _IntroMobileState();
}

class _IntroMobileState extends State<IntroMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final headerFont = TextStyle(
        fontSize: width >= 700 ? 80 : 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5);

    final introFont = TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 202, 205, 212),
        fontWeight: FontWeight.w400,
        height: 2,
        letterSpacing: 0.6);

    return Container(
      width: double.infinity,
      padding: width >= 700
          ? EdgeInsets.fromLTRB(110, 80, 110, 80)
          : EdgeInsets.fromLTRB(20, 80, 20, 80),
      color: Color.fromARGB(255, 1, 12, 85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width <= 700 ? 400 : 500,
            child: FittedBox(
                child: Text(
              'Know About Your\nHealth.',
              style: headerFont,
            )),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 500,
            child: Text(
              'When medical symptoms appear, Mediweb helps you understand what might be the cause. Just share a few details about your symptoms and some basic health info, and we’ll show you a list of the most likely diagnoses.',
              style: introFont,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryButton(
                  title: 'Start Diagnosis',
                  initalTextColor: Colors.black,
                  initialBgColor: Colors.white,
                  hoverInColor: Colors.black,
                  hoverInBgColor: Color.fromARGB(255, 213, 252, 121),
                  hoverOutColor: Colors.black,
                  hoverOutBgColor: Colors.white,
                  onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/medical.png',
                  scale: width < 450 ? 14 : 8),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
