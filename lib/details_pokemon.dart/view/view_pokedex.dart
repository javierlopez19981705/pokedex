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
    return Column(
      children: [
        const SizedBox(height: 16),
        const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: HeaderPokedex(),
        ),
        Expanded(child: _image(context: context)),
        const ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BottomPokedex(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _image({required BuildContext context}) {
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Image.asset('assets/images/pokeball.png'),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: pokemon.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: HeroImageNetwork(
                url: pokemon.sprites.other!.officialArtwork.frontDefault,
                idHero: pokemon.id.toString(),
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.height * .25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
