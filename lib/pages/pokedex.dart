import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    if (widget.pokemon == null || widget.pokemon.id == null) {
      return Text("POKEMON");
    } else {
      return Text(widget.pokemon.name!);
    }
  }
}
