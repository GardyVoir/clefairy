import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

class Attaques extends StatefulWidget {
  const Attaques({super.key, required this.pokemon});
  
  final Pokemon pokemon;
  @override
  State<Attaques> createState() => _AttaquesState();
}

class _AttaquesState extends State<Attaques> {
  @override
  Widget build(BuildContext context) {
    final moves = widget.pokemon.moves;
    if (moves == null || moves.isEmpty) {
      return const Text("No moves found");
    }

    final defaultMoves = moves.where((move) => move.versionGroupDetails?.any(
          (detail) => detail.moveLearnMethod?.name == "level-up" && detail.levelLearnedAt == 1,
        ) ?? false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Default moves:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...defaultMoves.map((move) => Text(move.move?.name ?? "-")),
      ],
    );
  }
}
