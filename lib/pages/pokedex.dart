import 'package:clefairy/widgets/type.dart';
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
    return this == null || this!.isEmpty ? "" : "${this!.substring(0, 1).toUpperCase()}${this!.substring(1)}";
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
                      Type(typeString: widget.pokemon.types?[0].type?.name ?? ""),
                      Type(typeString: widget.pokemon.types?.length == 2 ? widget.pokemon.types![1].type!.name! : ""),
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Taille : ${widget.pokemon.height! * 10} cm",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Poids : ${widget.pokemon.weight! * 10} g",
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: widget.pokemon.abilities!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        index == 0
                            ? Text(textAlign: TextAlign.left, '\r\nTalents :', style: const TextStyle(fontSize: 20))
                            : Container(),
                        ListTile(
                          title: Text(" - ${widget.pokemon.abilities![index].ability!.name!.capitalize()}",
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
