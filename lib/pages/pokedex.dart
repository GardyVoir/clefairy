import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  State<Pokedex> createState() => _PokedexState();
}

extension StringExtension on String? {
  String capitalize() {
    return this == null ? "" : "${this!.substring(0, 1).toUpperCase()}${this!.substring(1)}";
  }
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.pokemon.name.capitalize(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              "N°${widget.pokemon.id != null ? widget.pokemon.id.toString() : "?"}",
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Text(widget.pokemon.types?[0].type?.name?.capitalize() ?? ""),
                      Text(widget.pokemon.types?.length == 2 ? widget.pokemon.types![1].type!.name!.capitalize() : "")
                    ])
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white70,
                      width: 10,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.5),
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.pokemon.sprites?.frontDefault ?? "",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
