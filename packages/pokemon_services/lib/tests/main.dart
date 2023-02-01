import 'package:pokemon_services/pokemon_services.dart';

import '../src/models/pokemon_model.dart';

void main() async {
  final service = PokemonServices();
  final list = await service.fetchListPokemon(offset: 10);
  print('HERE');
  for (final element in list) {
    element.fold(
        (l) => print('OCURRIO UN ERROR'), (r) => print(pokemonModelToJson(r)));
    // print(element);
  }
}
