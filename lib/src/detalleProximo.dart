import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'package:jaja/src/navbar.dart';
import 'package:jaja/src/pago.dart';

class detalleproximo extends StatelessWidget {
  final dynamic movie;

  const detalleproximo({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterUrl = 'https://image.tmdb.org/t/p/w185${movie['poster_path']}';
    final name = movie['title'];
    final relaseDate = movie['release_date'];
    final rating = movie['vote_average'];
    final popularity = movie['popularity'];
    final overview = movie['overview'];
    final orTitle = movie['original_title'];
    final orLang = movie['original_language'];

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(posterUrl),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Titulo Original: $orTitle',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Idioma Original: $orLang',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Fecha de estreno: $relaseDate',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Calificacion: $rating',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Popularidad: $popularity',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Descripcion:$overview',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),

                  
                ],
              ),
            )),
          ],
        ));
  }
}
