part of 'home_pokemons_cubit.dart';

enum HomePokemonsStatus { loading, sucess, error, loadingMore }

class HomePokemonsState {
  HomePokemonsState({
    this.offset = 20,
    this.pokemons = const [],
    this.status = HomePokemonsStatus.loading,
  });
  final int offset;
  final List<PokemonModel> pokemons;
  final HomePokemonsStatus status;

  HomePokemonsState copyWith({
    int? offset,
    List<PokemonModel>? pokemons,
    HomePokemonsStatus? status,
  }) {
    return HomePokemonsState(
      offset: offset ?? this.offset,
      pokemons: pokemons ?? this.pokemons,
      status: status ?? this.status,
    );
  }
}
