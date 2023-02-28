import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

class Statistiques extends StatefulWidget {
  const Statistiques({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;
  @override
  State<Statistiques> createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    final stats = widget.pokemon.stats;
    if (stats == null || stats.isEmpty) {
      return const Text("No stats found");
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Stats:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        for (var stat in stats)
                          Center(
                            child: Text("${stat.stat?.name}: ${stat.baseStat}"),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
