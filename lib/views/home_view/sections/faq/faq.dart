import 'package:flutter/material.dart';

import '../../../../models/faq_model.dart';
import '../../../../widgets/buttons/primary_button.dart';

class FaqViewDetails extends StatelessWidget {
  const FaqViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final headerFont = TextStyle(
        fontSize: width >= 700 ? 50 : 40,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5);

    const titleFont = TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 28, 28, 28),
        fontWeight: FontWeight.w500,
        height: 2,
        letterSpacing: 0.6);


    const contentFont = TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w400,
        height: 2,
        letterSpacing: 0.6);
    return Container(
      width: 900,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Frequently Asked Questions',
            style: headerFont,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faqList.length,
              itemBuilder: (context, index) {
                FaqModel faq = faqList[index];
                return Column(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 253, 253, 253),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0))),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(
                          faq.title,
                          style: titleFont,
                        ),
                        subtitle: Text(
                          faq.content,
                          style: contentFont,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
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
