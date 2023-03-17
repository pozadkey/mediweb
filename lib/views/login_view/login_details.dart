// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mediweb/views/patients_records/patients_records.dart';

import '../../../widgets/buttons/primary_button.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  State<LoginDetails> createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  bool _isVisible = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final headerFont = TextStyle(
        fontSize: 24,
        color: Color.fromARGB(255, 255, 255, 255),
        fontWeight: FontWeight.w700);

    final subHeaderFont = TextStyle(
        fontSize: 14, color: Colors.grey[800], fontWeight: FontWeight.w400);


    final miniFont = TextStyle(
        fontSize: 12, color: Colors.red[500], fontWeight: FontWeight.w500);

    final labelFont = TextStyle(
        fontSize: 12, color: Colors.grey[400], fontWeight: FontWeight.w600);

    final errorText = TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 240, 93, 93),
        height: 1.5,
        letterSpacing: 0.6,
        fontWeight: FontWeight.w500);

    return Center(
      child: Container(
        padding: width >= 800
            ? EdgeInsets.fromLTRB(150, 40, 150, 40)
            : EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text('Login',
                      style: headerFont, textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: _isVisible,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[100],
                          border: Border.all(
                            color: Color.fromARGB(255, 211, 47, 47),
                            style: BorderStyle.solid,
                          )),
                      width: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text('Invalid login',
                                    style: miniFont, textAlign: TextAlign.left),
                              ),
                              MaterialButton(
                                padding: EdgeInsets.only(left: 10),
                                minWidth: 0,
                                onPressed: () {
                                  setState(() {
                                    _isVisible = false;
                                  });
                                },
                                child: Icon(Icons.cancel_outlined,
                                    size: 20, color: Colors.grey[700]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: subHeaderFont,
                  controller: _username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelStyle: labelFont,
                    hintText: 'Username',
                    hintStyle: labelFont,
                    errorStyle: errorText,
                    fillColor: const Color.fromARGB(255, 237, 236, 236),
                    filled: true,
                    contentPadding: width >= 800
                        ? EdgeInsets.fromLTRB(10, 14, 0, 14)
                        : EdgeInsets.fromLTRB(10, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(240, 52, 3, 199),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 93, 93),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 93, 93),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelStyle: labelFont,
                    errorStyle: errorText,
                    hintText: 'Password',
                    hintStyle: labelFont,
                    fillColor: const Color.fromARGB(255, 237, 236, 236),
                    filled: true,
                    contentPadding: width >= 800
                        ? EdgeInsets.fromLTRB(10, 14, 0, 14)
                        : EdgeInsets.fromLTRB(10, 0, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(240, 52, 3, 199),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 93, 93),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 93, 93),
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Login',
                    initalTextColor: Colors.white,
                    initialBgColor: Color.fromARGB(220, 27, 180, 70),
                    hoverInColor: Colors.white,
                    hoverInBgColor: Color.fromARGB(255, 27, 180, 70),
                    hoverOutColor: Colors.white,
                    hoverOutBgColor: Color.fromARGB(220, 27, 180, 70),
                    onPressed: () {
                      _formKey.currentState!.validate();
                      if (_username.value.text == 'drshola' &&
                          _password.value.text == 'wonderful123') {
                        setState(() {
                          _isVisible = false;
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => PatientsRecords()),
                          );
                        });
                      } else {
                        setState(() {
                          _isVisible = true;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
