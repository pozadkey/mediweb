import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/data_provider.dart';
import '../../models/symptoms_model.dart';
import '../../providers/dropdown/gender_provider.dart';
import '../../providers/dropdown/symptoms_provider.dart';
import '../../providers/textfields/age-textfield.dart';
import '../../providers/textfields/name-textfield.dart';
import '../../widgets/nav/navbar_logo.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  final _headerFont = const TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5);

  final _subHeaderFont = const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5);

  final _textFont = const TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 202, 205, 212),
      fontWeight: FontWeight.w500,
      height: 2,
      letterSpacing: 0.6);

  final _textFontSmall = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 65, 66, 68),
      fontWeight: FontWeight.w500,
      height: 2,
      letterSpacing: 0.6);

  final _warningText = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 231, 96, 78),
      fontWeight: FontWeight.w500,
      height: 2,
      letterSpacing: 0.6);

  final _warningText2 = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 231, 96, 78),
      fontWeight: FontWeight.w700,
      height: 2,
      letterSpacing: 0.6);

  final _textFont2 = const TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 228, 229, 231),
      fontWeight: FontWeight.w600,
      height: 2,
      letterSpacing: 0.6);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(diagonsisDataProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 8, 54),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 750,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NavLogo(
                            myColor: Colors.white,
                            logoTextSize: 18,
                            iconsSize: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Start Diagnosis.',
                        style: _headerFont,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Concerned about your health? Answer some simple questions to learn more about possible causes of your medical symptoms.',
                        style: _textFont,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  width: 750,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: 'DISCLAIMER: ', style: _warningText),
                      TextSpan(
                          text:
                              'This tool is not a substitute for professional medical advice, diagnosis, or treatment. If you are experiencing a life-threatening emergency that requires immediate attention please call the number for your local emergency service.',
                          style: _textFontSmall),
                    ])),
                  ),
                ),
                Container(
                  // color: Color.fromARGB(255, 1, 8, 54),
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  width: 750,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const NameTextField(),
                            const SizedBox(
                              height: 15,
                            ),
                            const AgeTextField(),
                            const SizedBox(
                              height: 15,
                            ),
                            const GenderMenu(),
                            const SizedBox(
                              height: 15,
                            ),
                            const SymptomsMenu(),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              child: data.when(
                                  data: (data) {
                                    List<SymptomsModel> symptomsList =
                                        data.map((e) => e).toList();
                                    return Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              width: 1.5)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Results:',
                                            style: _headerFont,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: 'Full name: ',
                                                style: _textFont),
                                            TextSpan(
                                                text: ref.watch(nameProvider),
                                                style: _textFont2),
                                          ])),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: 'Age: ',
                                                style: _textFont),
                                            TextSpan(
                                                text:
                                                    '${ref.watch(ageProvider)} years old ',
                                                style: _textFont2),
                                          ])),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: 'Gender: ',
                                                style: _textFont),
                                            TextSpan(
                                                text: ref.watch(genderProvider),
                                                style: _textFont2),
                                          ])),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: 'Symptoms: ',
                                                style: _textFont),
                                            TextSpan(
                                                text: ref
                                                    .watch(symptomNameProvider),
                                                style: _textFont2),
                                          ])),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            'Possible Diagnosis: ',
                                            style: _subHeaderFont,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              itemCount: symptomsList.length,
                                              itemBuilder:
                                                  (BuildContext ctx, i) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text.rich(
                                                        TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              'Illness name: ',
                                                          style: _textFont),
                                                      TextSpan(
                                                          text: symptomsList[i]
                                                              .issue
                                                              .name,
                                                          style: _textFont2),
                                                    ])),
                                                    Text.rich(
                                                        TextSpan(children: [
                                                      TextSpan(
                                                          text: 'Accuracy: ',
                                                          style: _textFont),
                                                      TextSpan(
                                                          text:
                                                              '${symptomsList[i].issue.accuracy.toString()}%',
                                                          style: _textFont2),
                                                    ])),
                                                    Text.rich(
                                                        TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              'International Classification of Diseases (ICD) Name: ',
                                                          style: _textFont),
                                                      TextSpan(
                                                          text: symptomsList[i]
                                                              .issue
                                                              .icdName,
                                                          style: _textFont2),
                                                    ])),
                                                    Text.rich(
                                                        TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              'Other Related Names: ',
                                                          style: _textFont),
                                                      TextSpan(
                                                          text: symptomsList[i]
                                                              .issue
                                                              .profName,
                                                          style: _textFont2),
                                                    ])),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                );

                                                //return Text(symptomsList[i].issue.name.toString());
                                              }),
                                        ],
                                      ),
                                    );
                                  },
                                  /*error: (err, s) => PrimaryButton(
                                        title: 'Get Started',
                                        initalTextColor: Colors.white,
                                        initialBgColor: const Color.fromARGB(
                                            238, 58, 135, 229),
                                        hoverInColor: Colors.black,
                                        hoverInBgColor: Colors.white,
                                        hoverOutColor: Colors.white,
                                        hoverOutBgColor: const Color.fromARGB(
                                            238, 58, 135, 229),
                                        onPressed: () {
                                        },
                                      ),*/
                                  error: (err, s) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Error getting data.',
                                              style: _warningText),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                                text: 'Reason: ',
                                                style: _warningText),
                                            TextSpan(
                                                text: err.toString(),
                                                style: _warningText2),
                                          ])),
                                        ],
                                      ),
                                  /*Text(
                                    
                                        err.toString(),
                                        style: _textFont,
                                      ),*/
                                  loading: () => Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Loading Data...',
                                              style: _textFont2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const LinearProgressIndicator(
                                              backgroundColor: Colors.white,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.greenAccent),
                                              minHeight: 20,
                                            ),
                                          ],
                                        ),
                                      )),
                            )
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
