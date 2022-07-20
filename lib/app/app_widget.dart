import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Loja Hasura',
      theme: ThemeData(
        primaryColor: Color(0xff797ec2),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff72afdd),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
