import 'package:clefairy/pages/pokedex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Type extends StatelessWidget {
  final String typeString;
  const Type({super.key, required this.typeString});

  @override
  Widget build(BuildContext context) {
    Color circleColor = const Color.fromARGB(0, 0, 0, 0);
    String svgPath = "assets/types/$typeString.svg";
    switch (typeString) {
      case "normal":
        circleColor = const Color(0xFFA0A2A0);
        break;
      case "fighting":
        circleColor = const Color(0xFFFF8100);
        break;
      case "flying":
        circleColor = const Color(0xFF82BAF0);
        break;
      case "poison":
        circleColor = const Color(0xFF923FCC);
        break;
      case "ground":
        circleColor = const Color(0xFF92501B);
        break;
      case "rock":
        circleColor = const Color(0xFFB0AB82);
        break;
      case "bug":
        circleColor = const Color(0xFF92A212);
        break;
      case "ghost":
        circleColor = const Color(0xFF713F71);
        break;
      case "steel":
        circleColor = const Color(0xFF60A2B9);
        break;
      case "fire":
        circleColor = const Color(0xFFE72324);
        break;
      case "water":
        circleColor = const Color(0xFF2481F0);
        break;
      case "grass":
        circleColor = const Color(0xFF3DA224);
        break;
      case "electric":
        circleColor = const Color(0xFFFAC100);
        break;
      case "psychic":
        circleColor = const Color(0xFFEF3F7A);
        break;
      case "ice":
        circleColor = const Color(0xFF3DD9FF);
        break;
      case "dragon":
        circleColor = const Color(0xFF4F60E2);
        break;
      case "dark":
        circleColor = const Color(0xFF4F3F3D);
        break;
      case "fairy":
        circleColor = const Color(0xFFEF71F0);
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: circleColor),
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: SvgPicture.asset(svgPath),
                  )),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            typeString.capitalize(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
