import 'package:flutter/material.dart';
import 'package:washrycustomer/ui/router.dart';
import 'package:washrycustomer/ui/view/loginV.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer',
//      onGenerateRoute: Router.generateRoutes,
//      initialRoute: '/',
    home: LoginV(),
    );
  }
}

