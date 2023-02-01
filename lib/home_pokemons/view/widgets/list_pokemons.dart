import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
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
        context.read<HomePokemonsCubit>().getMorePokemons();
      }
    });

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      physics: const BouncingScrollPhysics(),
      controller: controller,
      itemBuilder: (c, i) {
        if (loadingMore) {
          if (i == pokemons.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return _cardPokemonBuilder(
              pokemon: pokemons[i],
            );
          }
        } else {
          return _cardPokemonBuilder(
            pokemon: pokemons[i],
          );
        }
      },
      itemCount: loadingMore ? (pokemons.length + 1) : pokemons.length,
    );
  }

  Widget _cardPokemonBuilder({required PokemonModel pokemon}) {
    if (pokemon.color == null) {
      return FutureBuilder<PaletteGenerator>(
        future: _updatePaletteGenerator(
          pokemon.sprites.other!.officialArtwork.frontDefault,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            pokemon.color = snapshot.data!.colors.first;
            return CardPokemon(
              pokemon: pokemon,
              color: pokemon.color,
            );
          }
          return CardPokemon(pokemon: pokemon);
        },
      );
    }
    return CardPokemon(
      pokemon: pokemon,
      color: pokemon.color,
    );
  }

  Future<PaletteGenerator> _updatePaletteGenerator(String url) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(url).image,
    );
    return paletteGenerator;
  }
}
