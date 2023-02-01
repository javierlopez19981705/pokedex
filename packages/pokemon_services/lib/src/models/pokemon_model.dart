// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str) as Map<String, dynamic>);

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    required this.name,
    required this.sprites,
    required this.weight,
  });

  String name;
  Sprites sprites;
  int weight;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json['name'] as String,
        sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
        weight: json['weight'] as int,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sprites": sprites.toJson(),
        "weight": weight,
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'] as String,
        backFemale: json['back_female'] as dynamic,
        backShiny: json['back_shiny'] as String,
        backShinyFemale: json['back_shiny_female'] as dynamic,
        frontDefault: json['front_default'] as String,
        frontFemale: json['front_female'] as dynamic,
        frontShiny: json['front_shiny'] as String,
        frontShinyFemale: json['front_shiny_female'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}
