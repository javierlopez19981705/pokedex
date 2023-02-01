import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/home_pokemons/cubit/home_pokemons_cubit.dart';
import 'package:test_bloc_dummy/home_pokemons/view/widgets/list_pokemons.dart';

class HomePokemonsView extends StatelessWidget {
  const HomePokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomePokemonsCubit(context.read<PokemonServices>())..getPokemons(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POKEDEX'),
      ),
      backgroundColor: Color.fromRGBO(43, 41, 44, 1),
      body: BlocBuilder<HomePokemonsCubit, HomePokemonsState>(
        builder: (context, state) {
          switch (state.status) {
            case HomePokemonsStatus.loading:
              return const Center(child: CircularProgressIndicator());

            case HomePokemonsStatus.sucess:
              return ListPokemons(pokemons: state.pokemons);

            case HomePokemonsStatus.error:
              return const Text('Ha ocurrido un error');

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
