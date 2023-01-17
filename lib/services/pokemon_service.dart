import 'package:clefairy/models/pokemon.dart';

import '../api/api.dart';

class PokemonService {
  static PokemonService? _instance;

  factory PokemonService() => _instance ??= PokemonService._();

  PokemonService._();

  Future<Pokemon> getAllPokemons() async {
    var response = await Api().dio.get('pokemon?limit=2000');

    return Pokemon.fromJson(response.data);
  }

  Future<Pokemon> getPokemon(String id) async {
    var response = await Api().dio.get('pokemon/{name}');

    return Pokemon.fromJson(response.data);
  }
}
