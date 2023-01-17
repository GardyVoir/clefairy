import 'package:clefairy/pages/one.dart';
import 'package:clefairy/pages/two.dart';
import 'package:clefairy/pokedex_frames.dart';
import 'package:flutter/material.dart';

void main() {
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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Widget> pages = [
      pageone(),
      pagetwo()
      // CategoryScreen(email: user.email),
      // TabBarOrder(),
      // PayInScreen(),
      // ProfileScreen(),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(children: [
            Positioned(
                top: 0,
                child: Stack(children: [
                  CustomPaint(size: Size(size.width, 80), painter: TopFrame()),
                ])),
            Positioned(
                child: Align(
                    alignment: Alignment.center,
                    child: pages.elementAt(_currentIndex))),
            Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    CustomPaint(
                        size: Size(size.width, 160), painter: BottomFrame())
                  ],
                )),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menu'),
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Order'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_filled), label: 'Pay-in'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_filled), label: 'Profile'),
            ],
          ),
        ));
  }
}
