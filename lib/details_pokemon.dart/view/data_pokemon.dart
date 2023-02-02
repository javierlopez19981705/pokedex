import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'dart:math' as math;

class DataPokemon extends StatelessWidget {
  const DataPokemon({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 20,
          bottom: -MediaQuery.of(context).size.width * .25,
          child: Center(
            child: Image.asset(
              'assets/images/pokeball.png',
              width: MediaQuery.of(context).size.width * .9,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _image(context: context),
              const SizedBox(height: 16),
              _name(),
              const SizedBox(height: 16),
              _size(),
              const SizedBox(height: 16),
              _labelStats(),
              ..._dataAtack(context: context),
            ],
          ),
        )
      ],
    );
  }

  Widget _image({required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: pokemon.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(
            pokemon.sprites.other!.officialArtwork.frontDefault,
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.height * .25,
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return Text(
      pokemon.name.toUpperCase(),
      style: const TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _labelStats() {
    return const Text(
      'Estadisticas',
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _size() {
    const styleValue = TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );

    const styleLabel = TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 198, 198, 198),
      fontWeight: FontWeight.normal,
    );
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('${(pokemon.weight / 10).toString()} KG', style: styleValue),
            const SizedBox(height: 8),
            const Text('Peso', style: styleLabel),
          ],
        ),
        Column(
          children: [
            Text('${(pokemon.height / 10).toString()} M', style: styleValue),
            const SizedBox(height: 8),
            const Text('Tamaño', style: styleLabel),
          ],
        ),
      ],
    );
  }

  List<Widget> _dataAtack({required BuildContext context}) {
    return pokemon.stats.map((stat) {
      final color = Color((math.Random().nextDouble() * 0x888888).toInt())
          .withOpacity(1.0);

      final statDemo = math.Random().nextDouble() * stat.baseStat;
      final percent = ((100 * statDemo) / stat.baseStat) / 100;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              stat.stat.name.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 10,
                percent: percent,
                progressColor: color,
                animation: true,
                restartAnimation: true,
                barRadius: const Radius.circular(10),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
