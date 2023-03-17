// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediweb/views/about_view/about_view.dart';
import 'package:mediweb/views/admin/admin.dart';
import 'package:mediweb/views/dashboard/dashboard_view.dart';
import 'package:mediweb/views/login_view/login_view.dart';
import 'package:mediweb/views/patients_records/patients_records.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/secrets.dart';
import 'views/home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await myApiKey;
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Gordita',
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const HomeView(),
          '/admin': (BuildContext context) => const Admin(),
          '/dashboard': (BuildContext context) => const DashboardView(),
          '/patients': (BuildContext context) => const PatientsRecords(),
          '/about': (BuildContext context) => const AboutView(),
          '/login': (BuildContext context) => const LoginView(),
        });
  }
}
