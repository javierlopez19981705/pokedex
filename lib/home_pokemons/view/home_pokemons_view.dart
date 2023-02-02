import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/home_pokemons/cubit/home_pokemons_cubit.dart';
import 'package:test_bloc_dummy/home_pokemons/view/widgets/list_pokemons.dart';

import '../../details_pokemon.dart/cubit/details_pokemon_cubit.dart';

class HomePokemonsView extends StatelessWidget {
  const HomePokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKEDEX'),
      ),
      backgroundColor: const Color.fromRGBO(43, 41, 44, 1),
      body: BlocBuilder<HomePokemonsCubit, HomePokemonsState>(
        builder: (context, state) {
          switch (state.status) {
            case HomePokemonsStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case HomePokemonsStatus.sucess:
              return ListPokemons(pokemons: state.pokemons);

            case HomePokemonsStatus.error:
              return const Center(
                child: Text(
                  'Ha ocurrido un error',
                  style: TextStyle(color: Colors.white),
                ),
              );

            case HomePokemonsStatus.loadingMore:
              return ListPokemons(
                pokemons: state.pokemons,
                loadingMore: true,
              );
          }
        },
      ),
    );
  }
}
