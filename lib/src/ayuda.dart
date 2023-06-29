import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'package:jaja/src/pago.dart';

import 'navbar.dart';

class ayuda extends StatefulWidget {
  const ayuda({Key? key}) : super(key: key);

  @override
  State<ayuda> createState() => _ayudaState();
}

class _ayudaState extends State<ayuda> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Ayuda'),
          backgroundColor: const Color.fromRGBO(18, 130, 178, 1),
        ),
        body: Stack(
          children: [
            LitStarfieldContainer(), // Colocar LitStarfieldContainer() como fondo
          ],
        ),
      ),
    );
  }
}


