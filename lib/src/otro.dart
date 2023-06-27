import 'package:flutter/material.dart';

import 'navbar.dart';

class otro extends StatefulWidget {
  const otro({Key? key}) : super(key: key);

  @override
  State<otro> createState() => _otroState();
}

class _otroState extends State<otro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
      backgroundColor: const Color.fromARGB(255, 150, 195, 223),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 120.0,
              backgroundColor: Colors.blueAccent[100],
              backgroundImage: const AssetImage('images/logo.jpg'),
            ),
          ),
          const SizedBox(height: 20.0), // Espacio entre el avatar y el botón
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de login
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('login'),
            ),
          ),
          const SizedBox(height: 20.0), // Espacio entre el avatar y el botón
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Navigator.pushNamed(context, '/registrar');
              },
              child: const Text('Registrar'),
            ),
          ),
        ],
      ),
    );
  }
}
