import 'dart:convert';

import 'package:clefairy/models/pokemon_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/pokemon.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  Pokemon? get pokemon {
    String string = _sharedPrefs.getString(_pokemon) ?? "";
    if (string.isEmpty) {
      return null;
    } else {
      return Pokemon.fromJson(jsonDecode(string));
    }
  }

  set pokemon(Pokemon? value) {
    if (value == null) {
      _sharedPrefs.setString(_pokemon, "");
    } else {
      _sharedPrefs.setString(_pokemon, jsonEncode(value).toString());
    }
  }

  PokemonList? get pokemonList {
    String string = _sharedPrefs.getString(_pokemonList) ?? "";
    if (string.isEmpty) {
      return null;
    } else {
      return PokemonList.fromJson(jsonDecode(string));
    }
  }

  set pokemonList(PokemonList? value) {
    if (value == null) {
      _sharedPrefs.setString(_pokemonList, "");
    } else {
      _sharedPrefs.setString(_pokemonList, jsonEncode(value).toString());
    }
  }

  reset() {
    pokemon = null;
    pokemonList = null;
  }
}

// constants/strings.dart
const String _pokemon = "pokemon";
const String _pokemonList = "pokemonList";
