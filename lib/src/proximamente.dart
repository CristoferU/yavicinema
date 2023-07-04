import 'package:flutter/material.dart';
import 'package:jaja/src/ayuda.dart';
import 'package:jaja/src/cartelera.dart';
import 'package:jaja/src/detalle.dart';
import 'package:jaja/src/detalleProximo.dart';
import 'package:jaja/src/otro.dart';
import 'package:jaja/src/servicio.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<dynamic> _movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final movies = await getMovies();
    setState(() {
      _movies = movies;
    });
  }

  void _showMovieDetails(dynamic movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => detalleproximo(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Películas proximas a estrenarse'),
        ),
        drawer: Drawer(
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
                    MaterialPageRoute(
                        builder: (context) => PopularMoviesScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.movie_creation),
                title: const Text('Proximamente'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoviesScreen()),
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
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    final posterUrl =
                        'https://image.tmdb.org/t/p/w185${movie['poster_path']}';
                    return ListTile(
                      leading: Image.network(posterUrl),
                      title: Text(movie['title']),
                      onTap: () => _showMovieDetails(movie),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              )
            ],
          ),
        ));
  }
}
