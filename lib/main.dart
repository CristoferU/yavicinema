import 'package:flutter/material.dart';
import 'package:jaja/src/login.dart';
import 'package:jaja/src/otro.dart';
import 'package:jaja/src/pago.dart';
import 'package:jaja/src/registrar.dart';
import 'package:jaja/src/servicios.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   
final _routes = {
    '/registrar': (context) => const registrar(),
    '/login': (context) => const Login(),
    '/otro': (context) => const otro(),
    '/servicios': (context) => const Servicios(),
    '/pago': (context) => const Pago(),

  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: _routes,
      home: otro(),
      debugShowCheckedModeBanner: false,
    );
  }
}