import 'package:flutter/material.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/details_pokemon.dart/view/widgets/content_pokedex.dart';
import 'package:test_bloc_dummy/details_pokemon.dart/view/widgets/header_pokedex.dart';

import '../../widgets/hero_image_network.dart';

class ViewPokedex extends StatelessWidget {
  const ViewPokedex({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          const HeaderPokedex(),
          Expanded(child: _image(context: context)),
          const BottomPokedex(),
        ],
      ),
    );
  }

  Widget _image({required BuildContext context}) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: pokemon.color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 15),
          ),
          child: HeroImageNetwork(
            url: pokemon.sprites.other!.officialArtwork.frontDefault,
            idHero: pokemon.id.toString(),
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.height * .25,
          ),
        ),
      ),
    );
  }
}
