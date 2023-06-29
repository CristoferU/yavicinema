
import 'package:flutter/material.dart';
import 'package:jaja/src/ayuda.dart';
import 'package:jaja/src/cartelera.dart';
import 'package:jaja/src/login.dart';
import 'package:jaja/src/otro.dart';
import 'package:jaja/src/servicios.dart';



class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Cristofer Tambaco'),
            accountEmail: const Text('cad.yavirac@.edu.ec'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/logo.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Cartelera'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cartelera()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie_creation),
            title: const Text('Peliculas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Servicios()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ayuda'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ayuda()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Otro()),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi App'),
        ),
        body: const NavBar(),
      ),
    ),
  );
}
