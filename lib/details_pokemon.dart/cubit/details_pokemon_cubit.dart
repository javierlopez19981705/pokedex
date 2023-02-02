import 'package:bloc/bloc.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:pokemon_services/pokemon_services.dart';

part 'details_pokemon_state.dart';

class DetailsPokemonCubit extends Cubit<DetailsPokemonState> {
  DetailsPokemonCubit(this.pokemonServices) : super(DetailsPokemonState());
  final PokemonServices pokemonServices;
  TextToSpeech tts = TextToSpeech();

  getPokemonDescription({required String id, required String name}) async {
    final resp = await pokemonServices.fetchDescriptionPokemon(pokemon: id);
    resp.fold((l) => null,
        (r) => speechPokemonDescription(description: r, pokemon: name));
  }

  speechPokemonDescription(
      {required PokemonDescriptionModel description, required String pokemon}) {
    for (var entrie in description.flavorTextEntries.reversed) {
      if (entrie.language.name == 'es') {
        _speak('$pokemon \n\n ${entrie.flavorText.replaceAll('\n', ' ')}');
        return;
      }
    }
  }

  Future _speak(String audio) async {
    String language = 'es-MX';
    tts.setLanguage(language);
    tts.speak(audio);
  }
}
