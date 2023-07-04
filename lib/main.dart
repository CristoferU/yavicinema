import 'package:flutter/material.dart';
import 'package:jaja/src/cartelera.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'package:jaja/src/login.dart';
import 'package:jaja/src/otro.dart';
import 'package:jaja/src/pago.dart';
import 'package:jaja/src/registrar.dart';
import 'package:jaja/src/proximamente.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yavicinema',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const _HomeScreen(),
        '/registrar': (context) => const registrar(),
        '/login': (context) => const Login(),
        '/otro': (context) => const Otro(),
        '/servicios': (context) =>  MoviesScreen(),
        '/pago': (context) => const Pago(),
        '/cartelera': (context) =>  PopularMoviesScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Otro(),
    );
  }
}

class LitStarfieldImpl extends StatelessWidget {
  const LitStarfieldImpl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LitStarfieldContainer();
  }
}

