
import 'package:flutter/material.dart';
import 'package:jaja/src/login.dart';
import 'package:jaja/src/otro.dart';



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
            leading: const Icon(Icons.person_rounded),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.mark_chat_unread),
            title: const Text('Subir Mensaje'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.east),
            title: const Text('Estadistica'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const otro()),
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
