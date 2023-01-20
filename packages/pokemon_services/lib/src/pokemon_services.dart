import 'package:http/http.dart' as http;

/// {@template pokemon_services}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class PokemonServices {
  /// {@macro pokemon_services}
  PokemonServices({
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  final http.Client httpClient;
  final baseUrl = 'pokeapi.co';

  fetchListPokemon({required int offset}) {
    final endPoint = 'api/v2';
    final limit = '20';
    final uri = Uri.https(baseUrl, endPoint, {
      'limit': limit,
      'offset': offset.toString(),
    });

    final resp = httpClient.get(uri);
  }
}
