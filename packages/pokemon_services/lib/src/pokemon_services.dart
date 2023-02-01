import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_services/src/models/error_data_model.dart';
import 'package:pokemon_services/src/models/pokemon_model.dart';

/// {@template pokemon_services}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class PokemonServices {
  /// {@macro pokemon_services}
  PokemonServices({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final _baseUrl = 'pokeapi.co';

  Future<List<Either<ErrorDataModel, PokemonModel>>> fetchListPokemon(
      {required int offset}) async {
    final initial = offset - 29;

    final list = <Either<ErrorDataModel, PokemonModel>>[];

    for (var i = initial; i <= offset; i++) {
      final pokemonResponse = await _fetchPokemon(number: i);
      Either<ErrorDataModel, PokemonModel> response;
      pokemonResponse.fold(
        (l) {
          response = Left(l);
          list.add(response);
        },
        (r) {
          response = Right(pokemonModelFromJson(r.toString()));
          list.add(response);
        },
      );
    }

    // ignore: join_return_with_assignment

    return list;
  }

  Future<Either<ErrorDataModel, dynamic>> _fetchPokemon(
      {required int number}) async {
    final endPoint = 'api/v2/pokemon/$number';
    Either<ErrorDataModel, dynamic> response;

    try {
      final uri = Uri.https(_baseUrl, endPoint);
      final resp = await http.get(uri);
      if (resp.statusCode == 200) {
        response = Right(resp.body);
      } else {
        response = Left(ErrorDataModel(typeError: TypeError.EXTERNAL));
      }
    } catch (e) {
      response = Left(ErrorDataModel(typeError: TypeError.EXTERNAL));
    }
    return response;
  }
}
