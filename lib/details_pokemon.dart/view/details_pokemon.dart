import 'package:flutter/material.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/details_pokemon.dart/view/data_pokemon.dart';
import 'package:test_bloc_dummy/details_pokemon.dart/view/view_pokedex.dart';
import 'package:card_swiper/card_swiper.dart';

class DetailsPokemonView extends StatelessWidget {
  const DetailsPokemonView({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(pokemon.name.toUpperCase()),
      ),
      backgroundColor: Color.fromRGBO(43, 41, 44, 1),
      body: Swiper.children(
        physics: const BouncingScrollPhysics(),
        viewportFraction: .9,
        loop: false,
        scale: .95,
        children: [
          ViewPokedex(pokemon: pokemon),
          DataPokemon(pokemon: pokemon),
        ],
      ),
    );
  }
}
