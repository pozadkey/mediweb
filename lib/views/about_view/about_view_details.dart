import 'package:flutter/material.dart';

import '../../models/about_model.dart';
import '../../widgets/buttons/primary_button.dart';

class AboutViewDetails extends StatelessWidget {
  const AboutViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final headerFont = TextStyle(
        fontSize: width >= 700 ? 50 : 40,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5);
        
    const contentFont = TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 233, 234, 235),
        fontWeight: FontWeight.w400,
        height: 2,
        letterSpacing: 0.6);

    return Container(
      width: 800,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Mediweb',
            style: headerFont,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: aboutList.length,
              itemBuilder: (context, index) {
                AboutModel about = aboutList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    about.content,
                    style: contentFont,
                    textAlign: TextAlign.left,
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: width <= 700 ? double.infinity : 300,
            child: PrimaryButton(
              title: 'Start Diagnosis',
              initalTextColor: const Color.fromARGB(255, 1, 12, 85),
              initialBgColor: Colors.white,
              hoverInColor: const Color.fromARGB(255, 1, 12, 85),
              hoverInBgColor: const Color.fromARGB(255, 213, 252, 121),
              hoverOutColor: const Color.fromARGB(255, 1, 12, 85),
              hoverOutBgColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
            ),
          ),
        ],
      ),
    );
  }
}
