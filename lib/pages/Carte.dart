import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class Carte extends StatefulWidget {
 const Carte({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<Carte> createState() => _CarteState();
}

class _CarteState extends State<Carte> {
  @override
  Widget build(BuildContext context) {
     final moves = widget.pokemon.locationAreaEncounters;
    if (moves == null || moves.isEmpty) {
      return const Text("No moves found");
    }
    
    return Column();
    
  }
}
