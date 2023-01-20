import 'package:clefairy/components/search_bar.dart';
import 'package:clefairy/pages/Carte.dart';
import 'package:clefairy/pages/Pokemon.dart';
import 'package:clefairy/pages/Attaques.dart';
import 'package:clefairy/pages/Statistiques.dart';
import 'package:clefairy/pokedex_frames.dart';
import 'package:clefairy/services/pokemon_service.dart';
import 'package:clefairy/shared_preferencies.dart';
import 'package:flutter/material.dart';

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

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllPokemons();
  }

  getAllPokemons() async {
    var list = SharedPrefs().pokemonList;
    if (list == null || list.count == null || list.count == 0) {
      SharedPrefs().pokemonList = await PokemonService().getAllPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> pages = [
      const Pokemon(),
      const Attaques(),
      const Carte(),
      const Statistiques(),
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
            const Positioned.fill(top: 30, left: 10, right: 110, child: SearchBar()),
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
        ));
  }
}
