import 'package:clefairy/components/search_bar.dart';
import 'package:clefairy/pages/carte.dart';
import 'package:clefairy/pages/pokedex.dart';
import 'package:clefairy/pages/attaques.dart';
import 'package:clefairy/pages/statistiques.dart';
import 'package:clefairy/pokedex_frames.dart';
import 'package:clefairy/services/pokemon_service.dart';
import 'package:clefairy/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'models/pokemon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clefairy',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPokemons();
    });
    if (SharedPrefs().pokemon == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getRandomPokemon();
      });
    }
  }

  getAllPokemons() async {
    var list = SharedPrefs().pokemonList;
    if (list == null || list.count == null || list.count == 0) {
      await PokemonService().getAllPokemons();
    }
  }

  getRandomPokemon() async {
    await PokemonService().getRandomPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late Pokemon? pokemon = SharedPrefs().pokemon;
    late List<Widget> pages = [
      Pokedex(pokemon: pokemon),
      Attaques(pokemon: pokemon),
      Carte(),
      Statistiques(),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Positioned(
                top: 0,
                child: Stack(children: [
                  CustomPaint(size: Size(size.width, 80), painter: TopFrame()),
                ])),
            Positioned.fill(
                top: 30,
                left: 10,
                right: 110,
                child: SearchBar(
                  onPokemonSelect: (name) async {
                    if (name.isNotEmpty) {
                      var result = await PokemonService().getPokemon(name.toLowerCase());
                      setState(() {
                        pokemon = result;
                      });
                    }
                    setState(() {
                      pages;
                    });
                  },
                )),
            Positioned(child: Align(alignment: Alignment.center, child: pages.elementAt(_currentIndex))),
            Positioned(
                bottom: 0,
                child: Stack(
                  children: [CustomPaint(size: Size(size.width, 160), painter: BottomFrame())],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 70,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  selectedItemColor: Colors.white,
                  elevation: 0,
                  showSelectedLabels: true,
                  onTap: onTabTapped,
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 20,
                  items: [
                    const BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_outlined), label: 'Pokémon'),
                    const BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp), label: 'Attaques'),
                    const BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Carte'),
                    const BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Statistiques'),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
