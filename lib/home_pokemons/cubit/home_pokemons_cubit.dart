import 'package:bloc/bloc.dart';
import 'package:pokemon_services/pokemon_services.dart';

part 'home_pokemons_state.dart';

class HomePokemonsCubit extends Cubit<HomePokemonsState> {
  HomePokemonsCubit(this.pokemonServices) : super(HomePokemonsState());
  final PokemonServices pokemonServices;

  getPokemons() async {
    final pokemons = await pokemonServices.fetchListPokemon(
      offset: state.offset,
    );

    final List<PokemonModel> list = [];
    for (var pokemon in pokemons) {
      pokemon.fold(
        (l) => null,
        (r) {
          list.add(r);
          pokemonModelToJson(r);
        },
      );
    }
    emit(state.copyWith(
      offset: state.offset + 20,
      pokemons: [...state.pokemons, ...list],
      status: HomePokemonsStatus.sucess,
    ));
  }

  getMorePokemons() async {
    if (state.status == HomePokemonsStatus.loadingMore) {
      return;
    }
    emit(state.copyWith(
      status: HomePokemonsStatus.loadingMore,
    ));

    final pokemons = await pokemonServices.fetchListPokemon(
      offset: state.offset,
    );

    emit(state.copyWith(
      status: HomePokemonsStatus.sucess,
    ));

    final List<PokemonModel> list = [];
    for (var pokemon in pokemons) {
      pokemon.fold(
        (l) => null,
        (r) {
          list.add(r);
          pokemonModelToJson(r);
        },
      );
    }
    emit(state.copyWith(
      offset: state.offset + 20,
      pokemons: [...state.pokemons, ...list],
      status: HomePokemonsStatus.sucess,
    ));
  }
}
