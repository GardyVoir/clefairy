import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

enum DisplayMode { defaultMoves, otherMoves, allMoves }

class Attaques extends StatefulWidget {
  const Attaques({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<Attaques> createState() => _AttaquesState();
}

class _AttaquesState extends State<Attaques> {
  final ScrollController _scrollController = ScrollController();
  DisplayMode _displayMode = DisplayMode.allMoves;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() {});
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

    final allMoves = [...defaultMoves, ...otherMoves];

    final allMovesList = allMoves.map((move) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
            top: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            move.move?.name ?? "-",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    }).toList();

    final defaultMovesList = defaultMoves.map((move) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
            top: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          move.move?.name ?? "-",
          style: const TextStyle(fontSize: 20),
        ),
      );
    }).toList();

    final otherMovesList = otherMoves.map((move) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
            top: BorderSide(
              color: Color.fromRGBO(201, 45, 54, 0.9),
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          move.move?.name ?? "-",
          style: const TextStyle(fontSize: 20),
        ),
      );
    }).toList();

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Attaques",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Select Display Mode"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: const Text("Default Moves"),
                                leading: Radio<DisplayMode>(
                                  value: DisplayMode.defaultMoves,
                                  groupValue: _displayMode,
                                  onChanged: (DisplayMode? value) {
                                    setState(() {
                                      _displayMode = value!;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text("Other Moves"),
                                leading: Radio<DisplayMode>(
                                  value: DisplayMode.otherMoves,
                                  groupValue: _displayMode,
                                  onChanged: (DisplayMode? value) {
                                    setState(() {
                                      _displayMode = value!;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(201, 45, 54, 0.9), // Set the background color here
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0), // Add padding here
                        child: Image.asset(
                          'assets/icons/menu.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_displayMode == DisplayMode.allMoves)
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: allMovesList.length,
                    itemBuilder: (context, index) => allMovesList[index],
                  ),
                ),
              if (_displayMode == DisplayMode.defaultMoves)
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: defaultMovesList.length,
                    itemBuilder: (context, index) => defaultMovesList[index],
                  ),
                ),
              if (_displayMode == DisplayMode.otherMoves)
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: otherMovesList.length,
                    itemBuilder: (context, index) => otherMovesList[index],
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.red,
            child: Image.asset(
              'assets/icons/menu.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
