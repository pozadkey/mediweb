import 'package:flutter/material.dart';

import '../../../../widgets/buttons/primary_button.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final headerFont = TextStyle(
        fontSize: width >= 700 ? 50 : 40,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5);

    const textFont = TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 202, 205, 212),
        fontWeight: FontWeight.w400,
        height: 2,
        letterSpacing: 0.6);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: width >= 700
              ? const EdgeInsets.fromLTRB(110, 40, 110, 40)
              : const EdgeInsets.fromLTRB(20, 40, 20, 40),
          color: const Color.fromARGB(255, 1, 12, 85),
          child: Column(
            children: [
              Text(
                'About Mediweb',
                style: headerFont,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Mediweb allows you to choose a variety of factors related to your symptom, in order to help you narrow the potential medical conditions related to your symptom. This tool does not incorporate all the personal, health and demographic factors related to you, individually, that would allow a definitive cause or causes to be suggested. The most reliable way to determine the cause of your symptom, and what to do, is to visit your health-care provider. ',
                style: textFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: PrimaryButton(
                  title: 'Read more...',
                  initalTextColor: Colors.black,
                  initialBgColor: Colors.white,
                  hoverInColor: Colors.black,
                  hoverInBgColor: const Color.fromARGB(255, 213, 252, 121),
                  hoverOutColor: Colors.black,
                  hoverOutBgColor: Colors.white,
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
