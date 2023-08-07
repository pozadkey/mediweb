import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediweb/providers/textfields/email_textfield.dart';
import 'package:mediweb/providers/textfields/phone_textfield.dart';
import 'package:mediweb/providers/textfields/previous_symptoms_textfield.dart';
import '../../providers/data_provider.dart';
import '../../models/symptoms_model.dart';
import '../../providers/dropdown/gender_provider.dart';
import '../../providers/dropdown/symptoms_provider.dart';
import '../../providers/textfields/address_textfield.dart';
import '../../providers/textfields/age_textfield.dart';
import '../../providers/textfields/name_textfield.dart';
import '../../widgets/buttons/primary_button.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    final data = ref.watch(diagonsisDataProvider);
    bool isLoading = ref.watch(isLoadingProvider);

    addPatient() {
      FirebaseFirestore.instance.collection("patients").add({
        "name": ref.watch(nameProvider),
        "address": ref.watch(addressProvider),
        "age": int.parse(ref.watch(ageProvider)),
        "phone-number": int.parse(ref.watch(phoneProvider)),
        "email": ref.watch(emailProvider),
        "gender": ref.watch(genderProvider),
        "previous symptoms": ref.watch(previousSymptomsProvider),
        "symptoms": ref.watch(symptomNameProvider),
      });
    }

    return Center(
      child: Form(
        key: _formKey,
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
                        const AddressTextfield(),
                        const SizedBox(
                          height: 15,
                        ),
                        const AgeTextField(),
                        const SizedBox(
                          height: 15,
                        ),
                        const PhoneTextField(),
                        const SizedBox(
                          height: 15,
                        ),
                        const EmailTextField(),
                        const SizedBox(
                          height: 15,
                        ),
                        const GenderMenu(),
                        const SizedBox(
                          height: 15,
                        ),
                        const PreviousSymptomsTextField(),
                        const SizedBox(
                          height: 15,
                        ),
                        const SymptomsMenu(),
                        const SizedBox(
                          height: 25,
                        ),
                        PrimaryButton(
                            title: 'Run Diagnosis',
                            initalTextColor: Colors.white,
                            initialBgColor: const Color.fromARGB(220, 27, 180, 70),
                            hoverInColor: Colors.white,
                            hoverInBgColor: const Color.fromARGB(255, 27, 180, 70),
                            hoverOutColor: Colors.white,
                            hoverOutBgColor: const Color.fromARGB(220, 27, 180, 70),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                addPatient();
                                ref.read(isLoadingProvider.notifier).state =
                                    true;
                              } else {
                                ref.read(isLoadingProvider.notifier).state =
                                    false;
                              }
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        isLoading == false
                            ? const Text('')
                            : Container(
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
                                                  text: 'Patient\'s name: ',
                                                  style: _textFont),
                                              TextSpan(
                                                  text:
                                                      ref.watch(nameProvider),
                                                  style: _textFont2),
                                            ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text: 'Address: ',
                                                  style: _textFont),
                                              TextSpan(
                                                  text:
                                                      '${ref.watch(addressProvider)} ',
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
                                                  text: 'Phone number: ',
                                                  style: _textFont),
                                              TextSpan(
                                                  text: ref
                                                      .watch(phoneProvider),
                                                  style: _textFont2),
                                            ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text: 'Email: ',
                                                  style: _textFont),
                                              TextSpan(
                                                  text: ref
                                                          .watch(
                                                              emailProvider)
                                                          .isEmpty
                                                      ? 'N/A'
                                                      : ref.watch(
                                                          emailProvider),
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
                                                  text: ref
                                                      .watch(genderProvider),
                                                  style: _textFont2),
                                            ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text: 'Previous symptoms: ',
                                                  style: _textFont),
                                              TextSpan(
                                                  text: ref
                                                          .watch(
                                                              previousSymptomsProvider)
                                                          .isEmpty
                                                      ? 'N/A'
                                                      : ref.watch(
                                                          previousSymptomsProvider),
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
                                                  text: ref.watch(
                                                      symptomNameProvider),
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
                                                scrollDirection:
                                                    Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ScrollPhysics(),
                                                itemCount:
                                                    symptomsList.length,
                                                itemBuilder:
                                                    (BuildContext ctx, i) {
                                                  return Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text.rich(
                                                          TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'Illness name: ',
                                                            style: _textFont),
                                                        TextSpan(
                                                            text:
                                                                symptomsList[
                                                                        i]
                                                                    .issue
                                                                    .name,
                                                            style:
                                                                _textFont2),
                                                      ])),
                                                      Text.rich(
                                                          TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'Accuracy: ',
                                                            style: _textFont),
                                                        TextSpan(
                                                            text:
                                                                '${symptomsList[i].issue.accuracy.toString()}%',
                                                            style:
                                                                _textFont2),
                                                      ])),
                                                      Text.rich(
                                                          TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'International Classification of Diseases (ICD) Name: ',
                                                            style: _textFont),
                                                        TextSpan(
                                                            text:
                                                                symptomsList[
                                                                        i]
                                                                    .issue
                                                                    .icdName,
                                                            style:
                                                                _textFont2),
                                                      ])),
                                                      Text.rich(
                                                          TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'Other Related Names: ',
                                                            style: _textFont),
                                                        TextSpan(
                                                            text:
                                                                symptomsList[
                                                                        i]
                                                                    .issue
                                                                    .profName,
                                                            style:
                                                                _textFont2),
                                                      ])),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ],
                                        ),
                                      );
                                    },
                                    //skipError: true,
                                    // skipLoadingOnReload: true,
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
                                                  text:
                                                      'Invalid data provided.',
                                                  style: _warningText2),
                                            ])),
                                          ],
                                        ),
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
    );
  }
}
