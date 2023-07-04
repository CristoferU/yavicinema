import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_KEY = 'c8682de6e43a692f4b8e85e4b7ff4eb6';
const String BASE_URL = 'https://api.themoviedb.org/3';

Future<List<dynamic>> getPopularMovies() async {
  final response = await http.get(Uri.parse('$BASE_URL/movie/popular?api_key=$API_KEY&language=es-ES'));

  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    return decodedData['results'];
  } else {
    throw Exception('Error al obtener las películas populares.');
  }
}
Future<List<dynamic>> getMovies() async {
  final response = await http.get(Uri.parse('$BASE_URL/movie/upcoming?api_key=$API_KEY&language=es-ES'));

  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    return decodedData['results'];
  } else {
    throw Exception('Error al obtener las películas populares.');
  }
}