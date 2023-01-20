import 'package:flutter/material.dart';

import '../services/pokemon_service.dart';
import '../shared_preferences.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, required this.onPokemonSelect});
  final StringCallback onPokemonSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawAutocomplete(
          optionsBuilder: (TextEditingValue textEditingValue) async {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            } else {
              List<String> matches = <String>[];

              var list = SharedPrefs().pokemonList;
              if (list == null || list.count == null || list.count == 0) {
                await PokemonService().getAllPokemons();
                list = SharedPrefs().pokemonList;
              }
              var results = list!.results;

              var suggestions = results!.map((e) => e.name![0].toUpperCase() + e.name!.substring(1).toLowerCase());
              matches.addAll(suggestions);

              matches.retainWhere((s) {
                return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
              return matches;
            }
          },
          onSelected: (String selection) async {
            onPokemonSelect(selection);
          },
          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                  fillColor: Colors.white54,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Rechercher un Pokémon...",
                  isDense: false,
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              onChanged: (text) {},
              onSubmitted: (text) async {
                var pok = SharedPrefs().pokemon;
                if (pok == null) {
                  var pokemon = await PokemonService().getPokemon(text);
                  SharedPrefs().pokemon = pokemon;
                }
              },
            );
          },
          optionsViewBuilder: (BuildContext context, void Function(String) onSelected, Iterable<String> options) {
            return Material(
                color: Colors.transparent,
                child: SizedBox(
                    height: 10,
                    child: SingleChildScrollView(
                        child: Column(
                      children: options.map((opt) {
                        return InkWell(
                            onTap: () {
                              onSelected(opt);
                            },
                            child: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(right: 120),
                                child: Card(
                                    child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(opt),
                                ))));
                      }).toList(),
                    ))));
          },
        ),
      ],
    );
  }
}

typedef StringCallback = void Function(String name);
