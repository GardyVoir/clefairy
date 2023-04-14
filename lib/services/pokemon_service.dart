import 'dart:math';

import 'package:clefairy/models/location_area_encounters.dart';
import 'package:clefairy/models/pokemon.dart';
import 'package:clefairy/shared_preferences.dart';

import '../api/api.dart';
import '../models/pokemon_list.dart';

class PokemonService {
  static PokemonService? _instance;

  factory PokemonService() => _instance ??= PokemonService._();

  PokemonService._();

  Future<PokemonList> getAllPokemons() async {
    var response = await Api().dio.get('pokemon?limit=2000');
    var liste = PokemonList.fromJson(response.data);
    SharedPrefs().pokemonList = liste;
    return liste;
  }

  Future<Pokemon> getPokemon(String name) async {
    var response = await Api().dio.get('pokemon/$name');
    var pokemon = Pokemon.fromJson(response.data);
    return pokemon;
  }

  Future<Pokemon> getRandomPokemon() async {
    Random random = Random();
    int randomNumber = random.nextInt(152);
    var response = await Api().dio.get('pokemon/$randomNumber');
    var pokemon = Pokemon.fromJson(response.data);
    return pokemon;
  }

  Future<List<LocationAreaEncounter>> getLocation(String name) async {
    var response = await Api().dio.get('pokemon/$name/encounters');
   var locationareaencounters = List<LocationAreaEncounter>.from(response.data.map((x) => LocationAreaEncounter.fromJson(x)));
    
    return locationareaencounters;
  }
}
