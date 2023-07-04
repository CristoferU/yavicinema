import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';

import 'navbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _canLogin = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkLoginConditions() {
    setState(() {
      String username = _usernameController.text;
      String password = _passwordController.text;

      if (username == 'Cliente' && password.isNotEmpty) {
        _canLogin = true;
      } else {
        _canLogin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 167, 87, 37),
      ),
      body: Stack(
        children: [
          LitStarfieldContainer(), // Colocar LitStarfieldContainer() como fondo
          Container(
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
                  style: TextStyle(fontFamily: 'curisve', fontSize: 50.0,color: Colors.white),
                ),
                const Text(
                  'Bienvenido',
                  style: TextStyle(fontFamily: 'curisve', fontSize: 20.0,color: Colors.white),
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
                  child: Column(
                    children: [
                      TextField(
                        controller: _usernameController,
                        enableInteractiveSelection: false,
                        autofocus: true,
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(
                          hintText: 'user-name',
                          labelText: 'user name',
                          suffixIcon: Icon(Icons.verified_user),
                          border: InputBorder.none,
                        ),
                        onChanged: (_) => _checkLoginConditions(),
                      ),
                      Divider(
                        height: 25.0,
                      ),
                      TextField(
                        controller: _passwordController,
                        enableInteractiveSelection: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.lock_outline),
                          border: InputBorder.none,
                        ),
                        onChanged: (_) => _checkLoginConditions(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0), // Espacio entre el avatar y el botón
                Center(
                  child: ElevatedButton(
                    onPressed: _canLogin
                        ? () {
                            // Navegar a la pantalla de registro
                            Navigator.pushNamed(context, '/cartelera');
                          }
                        : null,
                    child: const Text('Iniciar sesión'),
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
                        color: Color.fromARGB(255, 244, 174, 54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
