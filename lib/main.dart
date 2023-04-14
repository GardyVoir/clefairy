import 'package:clefairy/widgets/search_bar.dart';
import 'package:clefairy/pages/carte.dart';
import 'package:clefairy/pages/pokedex.dart';
import 'package:clefairy/pages/attaques.dart';
import 'package:clefairy/pages/statistiques.dart';
import 'package:clefairy/pokedex_frames.dart';
import 'package:clefairy/services/pokemon_service.dart';
import 'package:clefairy/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/pokemon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clefairy',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool _isLoading = true;
  Pokemon pokemon = Pokemon();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllPokemons();
    loadPokemon();
  }

  getAllPokemons() async {
    var list = SharedPrefs().pokemonList;
    if (list == null || list.count == null || list.count == 0) {
      await PokemonService().getAllPokemons();
    }
  }

  Future<Pokemon> getRandomPokemon() async {
    try {
      return await PokemonService().getRandomPokemon();
    } catch (e) {
      scaffoldKey.currentState?.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      return Pokemon();
    }
  }

  Future<void> loadPokemon() async {
    pokemon = SharedPrefs().pokemon ?? Pokemon();
    if (pokemon.id == null) {
      setState(() {
        _isLoading = true;
      });
      final randomPokemon = await getRandomPokemon();
      setState(() {
        pokemon = randomPokemon;
        SharedPrefs().pokemon = pokemon;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Widget> pages = [
      Pokedex(pokemon: pokemon),
      Attaques(pokemon: pokemon),
      Carte(pokemon: pokemon),
      Statistiques(pokemon: pokemon),
    ];

    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(children: [
              (_isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Positioned(child: Align(alignment: Alignment.center, child: pages.elementAt(_currentIndex)))),
              Positioned(
                  top: 0,
                  child: Stack(children: [
                    CustomPaint(size: Size(size.width, 80), painter: TopFrame()),
                  ])),
              Positioned.fill(
                  top: 20,
                  left: 10,
                  right: 110,
                  child: SearchBar(onPokemonSelect: (name) async {
                    try {
                      if (name.isNotEmpty) {
                        var result = await PokemonService().getPokemon(name.trim().toLowerCase());
                        setState(() {
                          pokemon = result;
                        });
                      }
                    } on DioError catch (_) {
                      scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text("Le pokémon est introuvable"),
                      ));
                    } catch (_) {
                      scaffoldKey.currentState?.showSnackBar(const SnackBar(
                        content: Text("Une erreur s'est produite"),
                      ));
                    }
                  })),
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
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_outlined), label: 'Pokémon'),
                      BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp), label: 'Attaques'),
                      BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Carte'),
                      BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Statistiques'),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
