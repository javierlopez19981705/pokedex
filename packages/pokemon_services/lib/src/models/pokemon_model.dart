// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str) as Map<String, dynamic>);

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  PokemonModel({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.weight,
  });

  List<Ability> abilities;
  int baseExperience;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  List<dynamic> pastTypes;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  // List<Type> types;
  int weight;
  Color? color;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<Ability>.from((json["abilities"] as Iterable<dynamic>)
            .map((x) => Ability.fromJson(x as Map<String, dynamic>))),
        baseExperience: json["base_experience"] as int,
        forms: List<Species>.from((json["forms"] as Iterable<dynamic>)
            .map((x) => Species.fromJson(x as Map<String, dynamic>))),
        gameIndices: List<GameIndex>.from(
            (json["game_indices"] as Iterable<dynamic>)
                .map((x) => GameIndex.fromJson(x as Map<String, dynamic>))),
        height: json["height"] as int,
        heldItems: List<dynamic>.from(
            (json["held_items"] as Iterable<dynamic>).map((x) => x)),
        id: json["id"] as int,
        isDefault: json["is_default"] as bool,
        locationAreaEncounters: json["location_area_encounters"] as String,
        moves: List<Move>.from((json["moves"] as Iterable<dynamic>)
            .map((x) => Move.fromJson(x as Map<String, dynamic>))),
        name: json["name"] as String,
        order: json["order"] as int,
        pastTypes: List<dynamic>.from(
            (json["past_types"] as Iterable<dynamic>).map((x) => x)),
        species: Species.fromJson(json["species"] as Map<String, dynamic>),
        sprites: Sprites.fromJson(json["sprites"] as Map<String, dynamic>),
        stats: List<Stat>.from((json["stats"] as Iterable<dynamic>)
            .map((x) => Stat.fromJson(x as Map<String, dynamic>))),
        // types: List<Type>.from((json["types"] as Iterable<dynamic>)
        //     .map((x) => Type.fromJson(x as Map<String, dynamic>))),
        weight: json["weight"] as int,
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Species ability;
  bool isHidden;
  int slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"] as Map<String, dynamic>),
        isHidden: json["is_hidden"] as bool,
        slot: json["slot"] as int,
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"] as String,
        url: json["url"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  int gameIndex;
  Species version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"] as int,
        version: Species.fromJson(json["version"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
      };
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"] as Map<String, dynamic>),
        versionGroupDetails: List<VersionGroupDetail>.from(
            (json["version_group_details"] as Iterable<dynamic>).map(
                (x) => VersionGroupDetail.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  int levelLearnedAt;
  Species moveLearnMethod;
  Species versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"] as int,
        moveLearnMethod:
            Species.fromJson(json["move_learn_method"] as Map<String, dynamic>),
        versionGroup:
            Species.fromJson(json["version_group"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
      };
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  Sprites blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite:
            Sprites.fromJson(json["black-white"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  Sprites diamondPearl;
  Sprites heartgoldSoulsilver;
  Sprites platinum;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl:
            Sprites.fromJson(json["diamond-pearl"] as Map<String, dynamic>),
        heartgoldSoulsilver: Sprites.fromJson(
            json["heartgold-soulsilver"] as Map<String, dynamic>),
        platinum: Sprites.fromJson(json["platinum"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
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
    this.other,
    this.animated,
  });

  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Sprites? animated;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"] as String,
        backFemale: json["back_female"],
        backShiny: json["back_shiny"] as String,
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"] as String,
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"] as String,
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null
            ? null
            : Other.fromJson(json["other"] as Map<String, dynamic>),
        animated: json["animated"] == null
            ? null
            : Sprites.fromJson(json["animated"] as Map<String, dynamic>),
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
        "other": other?.toJson(),
        "animated": animated?.toJson(),
      };
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  Crystal crystal;
  Gold gold;
  Gold silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"] as Map<String, dynamic>),
        gold: Gold.fromJson(json["gold"] as Map<String, dynamic>),
        silver: Gold.fromJson(json["silver"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
      };
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  String backDefault;
  String backShiny;
  String backShinyTransparent;
  String backTransparent;
  String frontDefault;
  String frontShiny;
  String frontShinyTransparent;
  String frontTransparent;

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"] as String,
        backShiny: json["back_shiny"] as String,
        backShinyTransparent: json["back_shiny_transparent"] as String,
        backTransparent: json["back_transparent"] as String,
        frontDefault: json["front_default"] as String,
        frontShiny: json["front_shiny"] as String,
        frontShinyTransparent: json["front_shiny_transparent"] as String,
        frontTransparent: json["front_transparent"] as String,
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  String backDefault;
  String backShiny;
  String frontDefault;
  String frontShiny;
  String? frontTransparent;

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"] as String,
        backShiny: json["back_shiny"] as String,
        frontDefault: json["front_default"] as String,
        frontShiny: json["front_shiny"] as String,
        frontTransparent: (json["front_transparent"] ?? '') as String,
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  OfficialArtwork emerald;
  Gold fireredLeafgreen;
  Gold rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald:
            OfficialArtwork.fromJson(json["emerald"] as Map<String, dynamic>),
        fireredLeafgreen:
            Gold.fromJson(json["firered-leafgreen"] as Map<String, dynamic>),
        rubySapphire:
            Gold.fromJson(json["ruby-sapphire"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  String frontDefault;
  String frontShiny;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"] as String,
        frontShiny: json["front_shiny"] as String,
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"] as String,
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"] as String,
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  DreamWorld icons;
  Home ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"] as Map<String, dynamic>),
        ultraSunUltraMoon:
            Home.fromJson(json["ultra-sun-ultra-moon"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  String frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"] as String,
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  DreamWorld icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
      };
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld:
            DreamWorld.fromJson(json["dream_world"] as Map<String, dynamic>),
        home: Home.fromJson(json["home"] as Map<String, dynamic>),
        officialArtwork: OfficialArtwork.fromJson(
            json["official-artwork"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"] as int,
        effort: json["effort"] as int,
        stat: Species.fromJson(json["stat"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"] as int,
        type: Species.fromJson(json["type"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
