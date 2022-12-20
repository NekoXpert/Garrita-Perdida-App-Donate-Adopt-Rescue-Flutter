import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/components/components.dart';

import '/presentation/layouts/intro_layout.dart';
//class ReportScreen extends StatelessWidget {
//const ReportSceren({Key? key}) : super(key: key);


void main() {
  runApp(MaterialApp(
    home: OnBoardingScreen(),
    theme: ThemeData(fontFamily: 'Circular'),
  ));
}

class OnBoardingScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Version 1.0.0',   selectionColor: Colors.white),
          backgroundColor: Color.fromARGB(255, 235, 99, 26),
        ),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupalwqfBt (KzNEqH6EyFcXjoSzevaLwQ)
                  padding: EdgeInsets.fromLTRB(83, 45, 82, 45),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 236, 233),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(135),
                      bottomLeft: Radius.circular(135),
                    ),
                  ),
                  child: Center(
                    // garritaperdidaMqQ (36:3)
                    child: SizedBox(
                      width: 195,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Container(
                  // Select and image from the gallery or take a picture with the camera

                  //   ElevatedButton.icon(
                  //     onPressed: () => navigateTo(context, const IntroLayout()),
                  //   icon: const Icon(Icons.home),

                  padding: EdgeInsets.fromLTRB(61.5, 33, 61.5, 52),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroup4gaaRaN (KzNExMin6FuZAtoE8B4GaA)
                        margin: EdgeInsets.fromLTRB(15.5, 0, 13.5, 31),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // cat11xqC (51:17)
                              margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                              width: 103,
                              height: 94,
                              child: Image.asset(
                                'assets/images/cat1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // dog11tD4 (56:18)
                              margin: EdgeInsets.fromLTRB(0, 36, 0, 0),
                              width: 98,
                              height: 100,
                              child: Image.asset(
                                'assets/images/no_orders.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // nuestramisionesserunmedioporel (36:13)
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 37),
                        constraints: BoxConstraints(
                          maxWidth: 237,
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Fredoka',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.21,
                              color: Color(0xff000000),
                            ),
                            children: [
                              TextSpan(
                                text: '"Nuestra mision es ser ',
                              ),
                              TextSpan(
                                text: 'un medio',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xffcd530f),
                                ),
                              ),
                              TextSpan(
                                text: ' por el cual ',
                              ),
                              TextSpan(
                                text: 'los amantes de los animales',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xffcd530f),
                                ),
                              ),
                              TextSpan(
                                text: ', puedan comunicarse de manera ',
                              ),
                              TextSpan(
                                text: 'omnicanal',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xffcd530f),
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xffcd530f),
                                ),
                              ),
                              TextSpan(
                                text: 'teniendo una información ',
                              ),
                              TextSpan(
                                text: 'clara y concisa',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xffcd530f),
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  fontFamily: 'Fredoka',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 1.21,
                                  color: Color(0xff000000),
                                ),
                              ),
                              TextSpan(
                                text: 'de la ayuda que se les da a estos."',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // group1ooC (36:16)
                        margin: EdgeInsets.fromLTRB(24.5, 0, 24.5, 0),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          

                            //child: Center(

                            child: Column(children: [
                              ElevatedButton(
                                onPressed: () =>
                                    navigateTo(context, const IntroLayout()),
                                    
                                child: Text(
                                  'EMPECEMOS',
                                 
                                  style: TextStyle(
                                    
                                      fontFamily: 'Fredoka',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      height: 1.21,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                               


                                          
                                ),
                              ),
                            ]),
                          ),
                        ),
                    
                            
                    ],
                  ),
                )

                // ElevatedButton.icon(
                //   onPressed: () => navigateTo(context, const IntroLayout()),
                // icon: const Icon(Icons.pets, color: Color.fromARGB(255, 255, 255, 255)),
                //label: const Text('EMPECEMOS', style:  TextStyle(fontFamily: 'Fredoka', fontSize: 22, fontWeight: FontWeight.w700, height: 0.5, color: Color.fromARGB(255, 255, 255, 255)),

                // ),
                //    )
              ],
            )));
  }
}
