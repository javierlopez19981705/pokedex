import 'package:flutter/material.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/details_pokemon.dart/view/details_pokemon.dart';

import '../../../widgets/hero_image_network.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({
    super.key,
    required this.pokemon,
    this.color,
  });

  final PokemonModel pokemon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPokemonView(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        color: color,
        child: Column(
          children: [
            _image(context: context),
          ],
        ),
      ),
    );
  }

  Widget _image({required BuildContext context}) {
    return HeroImageNetwork(
      url: pokemon.sprites.other!.officialArtwork.frontDefault,
      idHero: pokemon.id.toString(),
      width: MediaQuery.of(context).size.width * .3,
    );
  }
}
