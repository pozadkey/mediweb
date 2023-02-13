import 'package:flutter/material.dart';

import '../../../../widgets/buttons/primary_button.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  State<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends State<AboutDesktop> {
  final _headerFont = const TextStyle(
      fontSize: 50,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5);

  final _textFont = const TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 202, 205, 212),
      fontWeight: FontWeight.w400,
      height: 2,
      letterSpacing: 0.6);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 1000,
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
          color: const Color.fromARGB(255, 1, 12, 85),
          child: Column(
            children: [
              Text(
                'About Mediweb',
                style: _headerFont,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Mediweb allows you to choose a variety of factors related to your symptom, in order to help you narrow the potential medical conditions related to your symptom. This tool does not incorporate all the personal, health and demographic factors related to you, individually, that would allow a definitive cause or causes to be suggested. The most reliable way to determine the cause of your symptom, and what to do, is to visit your health-care provider. ',
                style: _textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                child: PrimaryButton(
                  title: 'Run Diagnosis',
                  initalTextColor: Colors.black,
                  initialBgColor: Colors.white,
                  hoverInColor: Colors.black,
                  hoverInBgColor: const Color.fromARGB(255, 213, 252, 121),
                  hoverOutColor: Colors.black,
                  hoverOutBgColor: Colors.white,
                   onPressed: () =>
                                  Navigator.pushNamed(context, '/dashboard'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
