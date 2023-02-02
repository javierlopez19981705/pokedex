// To parse this JSON data, do
//
//     final pokemonDescriptionModel = pokemonDescriptionModelFromJson(jsonString);

import 'dart:convert';

PokemonDescriptionModel pokemonDescriptionModelFromJson(String str) =>
    PokemonDescriptionModel.fromJson(json.decode(str) as Map<String, dynamic>);

String pokemonDescriptionModelToJson(PokemonDescriptionModel data) =>
    json.encode(data.toJson());

class PokemonDescriptionModel {
  PokemonDescriptionModel({
    required this.flavorTextEntries,
  });

  List<FlavorTextEntry> flavorTextEntries;

  factory PokemonDescriptionModel.fromJson(Map<String, dynamic> json) =>
      PokemonDescriptionModel(
        flavorTextEntries: List<FlavorTextEntry>.from(
            (json["flavor_text_entries"] as Iterable).map(
                (x) => FlavorTextEntry.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  String flavorText;
  Language language;
  Language version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"] as String,
        language: Language.fromJson(json["language"] as Map<String, dynamic>),
        version: Language.fromJson(json["version"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version": version.toJson(),
      };
}

class Language {
  Language({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"] as String,
        url: json["url"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
