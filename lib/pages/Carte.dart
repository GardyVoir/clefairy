import 'package:clefairy/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import '../models/location_area_encounters.dart';
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
    return FutureBuilder<List<LocationAreaEncounter>>(
      future: PokemonService().getLocation(widget.pokemon.name!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No location area encounters found");
        }
        return Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            child: Column(
              children: [
                const Text(
                  "Location Area Encounters",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final encounter = snapshot.data![index];
                      return ListTile(
                        title: Text(encounter.locationArea?.name ?? 'Unknown'),
                        subtitle: Text('Version: ${encounter.versionDetails![0].version!.name ?? 'Unknown'}'),
                      );
                    },
                  ),
                ),
              ],
            ), // <-- add closing parenthesis here
          ),
        );
      },
    );
  }
}
