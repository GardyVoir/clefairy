import 'package:clefairy/models/pokemon.dart';
import 'package:flutter/material.dart';

class Attaques extends StatefulWidget {
  const Attaques({super.key});

  @override
  State<Attaques> createState() => _AttaquesState();
}

class _AttaquesState extends State<Attaques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width * 0.98,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Text(
                                "Capacités de base",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 170,
                                  width: MediaQuery.of(context).size.width * 0.96,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Container(
                                              height: 40,
                                              width: MediaQuery.of(context).size.width * 0.85,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Capacité 1",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Capacité 2",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Capacité 3",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 40,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Capacité 4",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],)
                                                ],
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Capacité à apprendre",
                                                style: TextStyle(
                                                    color: Colors.black.withOpacity(0.4),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
