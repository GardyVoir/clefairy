import 'package:flutter/material.dart';

class PokedexFrame extends StatefulWidget {
  const PokedexFrame({super.key});

  @override
  State<PokedexFrame> createState() => _PokedexFrameState();
}

class _PokedexFrameState extends State<PokedexFrame> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          top: 0,
          child: Stack(children: [
            CustomPaint(size: Size(size.width, 80), painter: TopFrame()),
          ])),
      Positioned(
          bottom: 0,
          child: Stack(
            children: [
              CustomPaint(size: Size(size.width, 160), painter: BottomFrame())
            ],
          ))
    ]);
  }
}

class TopFrame extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(201, 45, 54, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 50);
    path.lineTo(size.width * 0.75, 50);
    path.lineTo(size.width, 140);
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BottomFrame extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(201, 45, 54, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.25, 90);
    path.lineTo(size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path.shift(const Offset(0, -10)), Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Navigator extends BottomNavigationBar {
  Navigator({super.key, required super.items});
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.pink,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
