
import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'package:jaja/src/navbar.dart';


class registrar extends StatefulWidget {
  const registrar({Key? key}) : super(key: key);

  @override
  State<registrar> createState() => _registrarState();
}

class _registrarState extends State<registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('registrar'),
        backgroundColor: const Color.fromARGB(255, 167, 87, 37),
      ),
      body: Stack(
        children:[
        LitStarfieldContainer(), 
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
              'registrar',
              style: TextStyle(fontFamily: 'curisve', fontSize: 50.0,color: Colors.white),
            ),
            const Text(
              'Bien venido ',
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
                    enableInteractiveSelection: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: ' Email',
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email_outlined),
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
        ],
      ),
    );
  }
}
