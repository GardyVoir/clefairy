import 'package:clefairy/models/pokemon.dart';
import 'package:clefairy/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attaques extends StatefulWidget {
  const Attaques({super.key, required this.pokemon});
  
  final Pokemon? pokemon;
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
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Container(
                          // height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children:  [
                              Text(
                               "Attaques de base: ${widget.pokemon?.moves!.join(', ')}",
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
                                              width: MediaQuery.of(context).size.width * 0.85,
                                              margin: const EdgeInsets.only(bottom: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Attaque 1",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Attaque 2",
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
                                                  Spacer(),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Attaque 3",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: MediaQuery.of(context).size.width * 0.4,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(201, 45, 54, 0.9),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Attaque 4",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
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
                              /* SizedBox(
                                height: 15,
                              ),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),),
                                SizedBox(height: 8,),
                                Container(
                                  height: 400,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.96,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.3,
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("",
                                                  style: TextStyle(
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(0.75),
                                                  ),),
                                              ),
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.3,
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("",
                                                  style: TextStyle(
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(0.75),
                                                  ),),
                                              ),
                                            ),
                                            
                                               Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  "test",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                  ),),
                                              ),
                                            
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.3,
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("Hello",
                                                  style: TextStyle(
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(0.75),
                                                  ),),
                                              ),
                                            ),
                                            
                                               Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                 "Test",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                  ),),
                                              ),
                                            
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.3,
                                              decoration: BoxDecoration(
                                                
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text("Sp. Attack",
                                                  style: TextStyle(
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(0.75),
                                                  ),),
                                              ),
                                            ),
                                           
                                               Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  "hello",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                  ),),
                                              ),
                                            
                                          ],
                                        ),
                                      ),
                                      
                                      
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.96,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Text("Hello ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black.withOpacity(
                                                    0.6),
                                              ),),
                                            /* Text(total.toString(),
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: thickColor,
                                              ),), */
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ), */
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
