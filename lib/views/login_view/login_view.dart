// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mediweb/views/login_view/login_details.dart';
import 'package:mediweb/widgets/footer/footer.dart';
import '../../widgets/nav/navbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LayoutBuilder(
            builder: (context, constraints) => Scaffold(
                  backgroundColor: const Color.fromARGB(255, 1, 12, 85),
                  body: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [NavBar(), LoginDetails(), Footer()],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
      } else {
        return LayoutBuilder(
            builder: (context, constraints) => Scaffold(
                  backgroundColor: const Color.fromARGB(255, 1, 12, 85),
                  body: Column(
                    children: [
                      NavBar(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                LoginDetails(),
                               
                                Footer()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
      }
    });
  }
}
