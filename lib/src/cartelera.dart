import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'package:jaja/src/pago.dart';

import 'navbar.dart';

class Cartelera extends StatefulWidget {
  const Cartelera({Key? key}) : super(key: key);

  @override
  State<Cartelera> createState() => _CarteleraState();
}

class _CarteleraState extends State<Cartelera> {
  final List<Pet> pets = [
    Pet(
      name: 'INDIANA JONES 5',
      species: 'Aventura',
      age: 18,
      image: 'images/cartelera1.jpg',
      description:
          'Harrison Ford retoma el papel del legendario héroe arqueólogo en la quinta entrega de la icónica franquicia.',
    ),
    Pet(
      name: 'KRAKENS Y SIRENAS',
      species: 'Animada',
      age: 15,
      image: 'images/Cartelera2.jpg',
      description:
          'Es la historia de Ruby Gillman, una Kraken adolescente ( un calamar gigante) que ha ocultado sus poderes como gracias a su familia logra dominar sus poderes y ser una heorina.',
    ),
    
    Pet(
      name: 'ELEMENTOS',
      species: 'Animada',
      age: 15,
      image: 'images/cartelera3.jpg',
      description:
          'Una nueva película original de Disney y Pixar ambientada en Ciudad Elemento, donde conviven los residentes de Fuego, Agua, Tierra y Aire. La historia presenta a Candela, una joven dura, avispada y pasional, cuya amistad con un chico divertido, sensible y que se deja llevar, Nilo, desafía sus creencias sobre el mundo en el que viven.',
    ),
    
    Pet(
      name: 'HAZME EL FAVOR',
      species: 'Comedia',
      age: 15,
      image: 'images/cartelera4.jpg',
      description:
          'Cuando está a punto de perder su casa de la infancia, Maddie descubre un curioso anuncio de trabajo: unos adinerados padres controladores están buscando a alguien que salga con su introvertido hijo de 19 años, Percy, antes de que este vaya a la Universidad. Para su sorpresa, Maddie descubre pronto que la torpeza de Percy no está tan clara.',
    ),
    Pet(
      name: 'NOCHE DEL DEMONIO 5',
      species: 'Terror',
      age: 12,
      image: 'images/Cartelera5.jpg',
      description:
          'Para enterrar sus demonios de una vez por todas, Josh Lambert y un ya universitario Dalton Lambert, deberán profundizar en El Mas Allá más que nunca, enfrentándose al oscuro pasado familiar y a un huésped de nuevos horrores terroríficos que acechan tras la puerta roja.',
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
              Image.asset(
              pet.image,
              width: 150, // Ajusta el ancho de la imagen según tus necesidades
              height: 150, // Ajusta la altura de la imagen según tus necesidades
              fit: BoxFit.contain, // Ajusta la forma en que se ajusta la imagen al contenedor
            ),
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
          title: const Text('Cartelera'),
          backgroundColor: const Color.fromRGBO(18, 130, 178, 1),
        ),
      body: Stack(
        children: [
          LitStarfieldContainer(), // Colocar LitStarfieldContainer() como fondo
          ListView.builder(
            itemCount: pets.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(87, 255, 255, 255), // Establecer el color de fondo blanco con opacidad
                  borderRadius: BorderRadius.circular(50), // Establecer el radio de borde circular al 50%
                ),
                padding: const EdgeInsets.all(8.0), // Agregar un relleno al contenedor
                margin: const EdgeInsets.symmetric(vertical: 4.0), // Agregar un margen vertical al contenedor
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(pets[index].image),
                  ),
                  title: Text(pets[index].name),
                  subtitle: Text(pets[index].species),
                  onTap: () {
                    _showAlert(context, pets[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    ));
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
