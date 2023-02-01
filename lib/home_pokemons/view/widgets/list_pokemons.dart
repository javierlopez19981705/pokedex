import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/home_pokemons/cubit/home_pokemons_cubit.dart';

import 'card_pokemon.dart';

class ListPokemons extends StatelessWidget {
  ListPokemons({
    super.key,
    required this.pokemons,
    this.loadingMore = false,
  });

  final List<PokemonModel> pokemons;
  final bool loadingMore;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.offset > (controller.position.maxScrollExtent - 200)) {
        print('VAMOS A BUSCAR INFORMACION');
        context.read<HomePokemonsCubit>().getMorePokemons();
      }
    });

    return ListView.builder(
      controller: controller,
      itemBuilder: (c, i) {
        if (loadingMore) {
          if (i == pokemons.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return CardPokemon(
              pokemon: pokemons[i],
            );
          }
        } else {
          return CardPokemon(
            pokemon: pokemons[i],
          );
        }
      },
      itemCount: loadingMore ? (pokemons.length + 1) : pokemons.length,
    );
  }
}
