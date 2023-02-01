import 'package:flutter/material.dart';
import 'package:pokemon_services/pokemon_services.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _image(),
          Text(pokemon.name),
        ],
      ),
    );
  }

  Widget _image() {
    return Image.network(pokemon.sprites.frontDefault);
  }
}
