import 'package:clefairy/models/pokemon.dart';

import '../api/api.dart';
import '../models/pokemon_list.dart';

class PokemonService {
  static PokemonService? _instance;

  factory PokemonService() => _instance ??= PokemonService._();

  PokemonService._();

  Future<PokemonList> getAllPokemons() async {
    var response = await Api().dio.get('pokemon?limit=2000');

    return PokemonList.fromJson(response.data);
  }

  Future<Pokemon> getPokemon(String name) async {
    var response = await Api().dio.get('pokemon/$name');

    return Pokemon.fromJson(response.data);
  }
}
