import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_services/src/models/error_data_model.dart';

/// {@template pokemon_services}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class PokemonServices {
  /// {@macro pokemon_services}
  PokemonServices({
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  final http.Client httpClient;
  final _baseUrl = 'pokeapi.co';

  fetchListPokemon({required int offset}) {}

  Future<Either<ErrorDataModel, dynamic>> _fetchPokemon(
      {required int number}) async {
    final endPoint = 'api/v2/$number';
    Either<dynamic, dynamic> response;

    try {
      final uri = Uri.https(_baseUrl, endPoint);
      final resp = await http.get(uri);
      if (resp.statusCode == 200) {
        return resp.body;
      }
    } catch (e) {
      response = Left(ErrorDataModel(typeError: TypeError.EXTERNAL));
    }
  }
}
