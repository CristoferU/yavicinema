import 'package:flutter/material.dart';

import 'navbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 167, 87, 37),
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 247, 248),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.blueAccent[100],
                backgroundImage: const AssetImage('images/logo.jpg'),
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(fontFamily: 'curisve', fontSize: 50.0),
            ),
            const Text(
              'Ejemplo - 2',
              style: TextStyle(fontFamily: 'curisve', fontSize: 20.0),
            ),
            const SizedBox(
              width: 100.0,
              height: 15.0,
              child: Divider(
                color: Color.fromARGB(255, 65, 112, 136),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 226, 225),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Column(
                children: [
                  TextField(
                    enableInteractiveSelection: false,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'user-name',
                      labelText: 'user name',
                      suffixIcon: Icon(Icons.verified_user),
                      border: InputBorder.none,
                    ),
                  ),
                  Divider(
                    height: 25.0,
                  ),
                  TextField(
                    enableInteractiveSelection: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0), // Espacio entre el avatar y el botón
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de registro
                  Navigator.pushNamed(context, '/servicios');
                },
                child: const Text('iniciar sesión'),
              ),
            ),
            const SizedBox(height: 20.0), // Espacio entre el botón y los iconos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // Acción al presionar el botón de Facebook
                    Navigator.pushNamed(
                        context, '/servicios'); // Cambio en la ruta
                  },
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 40.0), // Espacio entre los iconos
                IconButton(
                  onPressed: () {
                    // Acción al presionar el botón de Google
                    Navigator.pushNamed(
                        context, '/servicios'); // Cambio en la ruta
                  },
                  icon: const Icon(
                    Icons.alternate_email_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
