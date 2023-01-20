import 'package:clefairy/models/pokemon.dart';
import 'package:clefairy/shared_preferencies.dart';

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
    SharedPrefs().pokemon = pokemon;
    return pokemon;
  }
}
