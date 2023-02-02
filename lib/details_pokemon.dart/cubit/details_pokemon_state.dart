part of 'details_pokemon_cubit.dart';

enum DetailsPokemonStatus { loading, sucess, error, loadingMore }

class DetailsPokemonState {
  DetailsPokemonState({
    this.status = DetailsPokemonStatus.loading,
    this.description,
  });
  final PokemonDescriptionModel? description;
  final DetailsPokemonStatus status;

  DetailsPokemonState copyWith({
    DetailsPokemonStatus? status,
    PokemonDescriptionModel? description,
  }) {
    return DetailsPokemonState(
      status: status ?? this.status,
      description: description ?? this.description,
    );
  }
}
