// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import '../../widgets/footer/footer.dart';
import '../../widgets/nav/navbar.dart';
import 'sections/about/about.dart';
import 'sections/intro/intro.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return LayoutBuilder(
            builder: (context, constraints) => Scaffold(
                  backgroundColor: Color.fromARGB(255, 1, 12, 85),
                  body: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [NavBar(), Intro(), About(), Footer()],
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
                  backgroundColor: Color.fromRGBO(1, 12, 85, 1),
                  body: Column(
                    children: [
                      NavBar(),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Intro(),
                                  About(),
                                  Footer()
                                ],
                              ),
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
