import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

class Attaques extends StatefulWidget {
  const Attaques({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<Attaques> createState() => _AttaquesState();
}

class _AttaquesState extends State<Attaques> {
  int _visibleMovesCount = 5;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {
          _visibleMovesCount += 5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final moves = widget.pokemon.moves;
    if (moves == null || moves.isEmpty) {
      return const Text("No moves found");
    }
    final defaultMoves = moves.where((move) =>
        move.versionGroupDetails?.any(
          (detail) => detail.moveLearnMethod?.name == "level-up" && detail.levelLearnedAt == 1,
        ) ??
        false);

    final otherMoves = moves.where((move) =>
        move.versionGroupDetails?.any(
          (detail) => detail.moveLearnMethod?.name != "level-up",
        ) ??
        false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Other moves:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _visibleMovesCount > otherMoves.length ? otherMoves.length : _visibleMovesCount,
          itemBuilder: (context, index) => Text(otherMoves.elementAt(index).move?.name ?? "-"),
        ),
        Visibility(
          visible: _visibleMovesCount < otherMoves.length,
          child: TextButton(
            onPressed: () {
              setState(() {
                _visibleMovesCount += 5;
              });
            },
            child: const Text('Show more'),
          ),
        ),
      ],
    );
  }
}
