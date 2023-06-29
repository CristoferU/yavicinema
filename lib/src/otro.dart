import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'navbar.dart';

class Otro extends StatefulWidget {
  const Otro({Key? key}) : super(key: key);

  @override
  State<Otro> createState() => _OtroState();
}

class _OtroState extends State<Otro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      body: Stack(
        children: [
          LitStarfieldContainer(), 
          ListView(
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
        ],
      ),
    );
  }
}
