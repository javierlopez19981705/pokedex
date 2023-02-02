import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_services/pokemon_services.dart';
import 'package:test_bloc_dummy/home_pokemons/view/home_pokemons_view.dart';

import 'details_pokemon.dart/cubit/details_pokemon_cubit.dart';
import 'home_pokemons/cubit/home_pokemons_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PokemonServices(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DetailsPokemonCubit>(
            create: (context) =>
                DetailsPokemonCubit(context.read<PokemonServices>()),
          ),
          BlocProvider(
            create: (context) =>
                HomePokemonsCubit(context.read<PokemonServices>())
                  ..getPokemons(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          // routes: {},
          home: const HomePokemonsView(),
        ),
      ),
    );
  }
}
