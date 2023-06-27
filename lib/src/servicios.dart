import 'package:flutter/material.dart';
import 'package:jaja/src/pago.dart';

import 'navbar.dart';

class Servicios extends StatefulWidget {
  const Servicios({Key? key}) : super(key: key);

  @override
  State<Servicios> createState() => _ServiciosState();
}

class _ServiciosState extends State<Servicios> {
  final List<Pet> pets = [
    Pet(
      name: 'Evil Dead Rise',
      species: 'Terror',
      age: 18,
      image: 'images/pelicula1.jpg',
      description:
          'En un edificio de apartamentos de Los Ángeles, dos hermanas luchan contra los demonios sedientos de sangre que han salido de un libro antiguo.',
    ),
    Pet(
      name: 'Evil Dead Rise',
      species: 'Terror',
      age: 18,
      image: 'images/pelicula1.jpg',
      description:
          'En un edificio de apartamentos de Los Ángeles, dos hermanas luchan contra los demonios sedientos de sangre que han salido de un libro antiguo.',
    ),
    Pet(
      name: 'Culpa Mia',
      species: 'Romance',
      age: 15,
      image: 'images/pelicula2.jpg',
      description:
          'La joven Noah deja todo para mudarse a la mansión de William Leister, el flamante y rico marido de su madre Rafaela. Allí conoce a Nick, su nuevo hermanastro. Ella no tarda en descubrir que, tras la imagen de hijo modelo, Nick oculta algo.',
    ),
    Pet(
      name: 'Evil Dead Rise',
      species: 'Terror',
      age: 18,
      image: 'images/pelicula1.jpg',
      description:
          'En un edificio de apartamentos de Los Ángeles, dos hermanas luchan contra los demonios sedientos de sangre que han salido de un libro antiguo.',
    ),
    Pet(
      name: 'Culpa Mia',
      species: 'Romance',
      age: 15,
      image: 'images/pelicula2.jpg',
      description:
          'La joven Noah deja todo para mudarse a la mansión de William Leister, el flamante y rico marido de su madre Rafaela. Allí conoce a Nick, su nuevo hermanastro. Ella no tarda en descubrir que, tras la imagen de hijo modelo, Nick oculta algo.',
    ),
    Pet(
      name: 'Ghosted',
      species: 'Acción/Romance',
      age: 15,
      image: 'images/pelicula3.jpg',
      description:
          'Cole se enamora perdidamente de la enigmática Sadie, pero descubre que es una agente secreta. Antes de que puedan decidir una segunda cita, Cole y Sadie se ven arrastrados a una aventura internacional para salvar el mundo.',
    ),
    Pet(
      name: 'Evil Dead Rise',
      species: 'Terror',
      age: 18,
      image: 'images/pelicula1.jpg',
      description:
          'En un edificio de apartamentos de Los Ángeles, dos hermanas luchan contra los demonios sedientos de sangre que han salido de un libro antiguo.',
    ),
    Pet(
      name: 'Ghosted',
      species: 'Acción/Romance',
      age: 15,
      image: 'images/pelicula3.jpg',
      description:
          'Cole se enamora perdidamente de la enigmática Sadie, pero descubre que es una agente secreta. Antes de que puedan decidir una segunda cita, Cole y Sadie se ven arrastrados a una aventura internacional para salvar el mundo.',
    ),
    Pet(
      name: 'Evil Dead Rise',
      species: 'Terror',
      age: 18,
      image: 'images/pelicula1.jpg',
      description:
          'En un edificio de apartamentos de Los Ángeles, dos hermanas luchan contra los demonios sedientos de sangre que han salido de un libro antiguo.',
    ),
    Pet(
      name: 'Culpa Mia',
      species: 'Romance',
      age: 15,
      image: 'images/pelicula2.jpg',
      description:
          'La joven Noah deja todo para mudarse a la mansión de William Leister, el flamante y rico marido de su madre Rafaela. Allí conoce a Nick, su nuevo hermanastro. Ella no tarda en descubrir que, tras la imagen de hijo modelo, Nick oculta algo.',
    ),
    Pet(
      name: 'Ghosted',
      species: 'Acción/Romance',
      age: 15,
      image: 'images/pelicula3.jpg',
      description:
          'Cole se enamora perdidamente de la enigmática Sadie, pero descubre que es una agente secreta. Antes de que puedan decidir una segunda cita, Cole y Sadie se ven arrastrados a una aventura internacional para salvar el mundo.',
    ),
    Pet(
      name: 'Culpa Mia',
      species: 'Romance',
      age: 15,
      image: 'images/pelicula2.jpg',
      description:
          'La joven Noah deja todo para mudarse a la mansión de William Leister, el flamante y rico marido de su madre Rafaela. Allí conoce a Nick, su nuevo hermanastro. Ella no tarda en descubrir que, tras la imagen de hijo modelo, Nick oculta algo.',
    ),
  ];

  void _showAlert(BuildContext context, Pet pet) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de ${pet.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(pet.image),
              const SizedBox(height: 5),
              Text('Genero: ${pet.species}'),
              const SizedBox(height: 5),
              Text('Edad permitida: ${pet.age} años'),
              const SizedBox(height: 3),
              const Text('Descripción:'),
              Text(pet.description),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pago()),
                );
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('YAVICINEMA'),
          backgroundColor: const Color.fromRGBO(18, 130, 178, 1),
        ),
        body: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(pets[index].image),
              ),
              title: Text(pets[index].name),
              subtitle: Text(pets[index].species),
              onTap: () {
                _showAlert(context, pets[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class Pet {
  final String name;
  final String species;
  final int age;
  final String image;
  final String description;

  Pet({
    required this.name,
    required this.species,
    required this.age,
    required this.image,
    required this.description,
  });
}
