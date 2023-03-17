import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PatientsRecords extends StatefulWidget {
  const PatientsRecords({super.key});

  @override
  State<PatientsRecords> createState() => _PatientsRecordsState();
}

class _PatientsRecordsState extends State<PatientsRecords> {
  final _headerFont = const TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5);


  final _textFont = const TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 83, 83, 83),
      fontWeight: FontWeight.w500,
      height: 2,
      letterSpacing: 0.6);




  final _warningText2 = const TextStyle(
      fontSize: 14,
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 750,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('patients')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      'Error loading records...',
                      style: _warningText2,
                    );
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Loading records...',
                              style: _textFont2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const LinearProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.greenAccent),
                              minHeight: 20,
                            ),
                          ],
                        ),
                      );
                    default:
                      return Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Patient Records',
                            style: _headerFont,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Authorized Personeel ONLY.',
                            style: _textFont2,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            padding: const EdgeInsets.only(top: 24),
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var patientsList =
                                  snapshot.data!.docs[index].data() as Map;
                              return ListTile(
                                tileColor: const Color.fromARGB(255, 255, 255, 255),
                                leading: const Icon(
                                  FontAwesomeIcons.hospitalUser,
                                  color: Color.fromARGB(255, 83, 83, 83),
                                ),
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Patient\'s name: ${patientsList['name']}',
                                      style: _textFont,
                                    ),
                                    Text(
                                      'Age: ${patientsList['age'].toString()}',
                                      style: _textFont,
                                    ),
                                    Text(
                                      'Home address: ${patientsList['address']}',
                                      style: _textFont,
                                    ),
                                    Text(
                                      'Phone number: ${patientsList['phone-number'].toString()}',
                                      style: _textFont,
                                    ),
                                    patientsList['email'].isEmpty
                                        ? Text(
                                            'Email: N/A',
                                            style: _textFont,
                                          )
                                        : Text(
                                            'Email: ${patientsList['email']}',
                                            style: _textFont,
                                          ),
                                    Text(
                                      'Gender: ${patientsList['gender']}',
                                      style: _textFont,
                                    ),
                                    patientsList['previous symptoms'].isEmpty
                                        ? Text(
                                            'Previous symptoms: N/A',
                                            style: _textFont,
                                          )
                                        : Text(
                                            'Previous symptoms: ${patientsList['previous symptoms']}',
                                            style: _textFont,
                                          ),
                                    Text(
                                      'Symptoms: ${patientsList['symptoms']}',
                                      style: _textFont,
                                    ),
                                  ],
                                ),
                                trailing: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Color.fromARGB(220, 27, 180, 70),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                  }
                },
              )),
        ],
      ),
    );
  }
}
