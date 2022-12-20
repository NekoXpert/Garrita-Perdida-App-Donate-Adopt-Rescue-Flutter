import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

import 'sign_up/garritas.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png", width: 210, height: 210),
          SizedBox(
            height: 480,
            child: Stack(
              children: [
                
                Positioned(
                  width: 150,
                  height: 480,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(90),
                        topRight: Radius.circular(90),
                      ),
                    ),
                  ),
                ),
                
                          
                Positioned(
                  top:30,
                  child: Column(
                 
                    children: [ 
                     
                      Padding (padding: EdgeInsets.all(20)),
                    Text("", style: TextStyle(fontSize: 30),),
                    Padding (padding: EdgeInsets.all(5)),
                    ElevatedButton.icon(
                          onPressed: () {
                            navigateTo(context, GarritasApp());
                          },
                          icon: Icon(Icons.pets_sharp, size:70,color: Color.fromARGB(255, 255, 255, 255) ),
                          label: Text(" GARRITAS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
                          Padding (padding: EdgeInsets.all(20)),
                        
                          //ElevatedButton.icon(
                          //onPressed: () {navigateTo(context, LoginScreen());},
                          //icon: Icon(Icons.health_and_safety, size: 50),
                          //label: Text("G", style: TextStyle(fontSize: 30))),
                          //   Padding(padding: EdgeInsets.all(10)),
                           ElevatedButton.icon(
                        onPressed: () {
                            navigateTo(context, GarritasApp());
                          },

                          icon: Icon(Icons.medical_information, size: 70),
                          label: Text("ALBERGUES ",  style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(20)),
                           ElevatedButton.icon(
                         onPressed: () {
                            navigateTo(context, GarritasApp());
                          },
                
                          icon: Icon(Icons.verified_user, size: 70),
                          label: Text("DONANTES", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                            Padding(padding: EdgeInsets.all(20)),
                        

                      //       buildMenuItem(
                      //       text: 'Request',
                      //     icon: Icons.read_more,
                      //   onClicked: () => {navigateTo(context, ProfileScreen());}),
                      // const SizedBox(height: 16),

                      //   const Text(
                      //  'Menu',
                      //style: TextStyle(
                      // fontSize: 30,
                      //fontWeight: FontWeight.bold,
                      // ),
                      // ),
                      // buildMenuItem(title: 'Gatos', quantity: 20, text:"hola",onClicked: () => {navigateTo(context, LoginScreen())}, icon: Icons.read_more, onPressed: () {navigateTo(context, LoginScreen());}),
                      // sizedBox10,
//ElevatedButton(onPressed: () {navigateTo(context, LoginScreen());}, child: Text("hola")),
                      //                     buildMenuItem(
                      //                      text: 'Request',
                      //                    icon: Icons.read_more,
                      //                  onPressed: () {
                      //                  navigateTo(context, LoginScreen());
                      //              }),
                    ],

                    /*  buildMenuItem(title: 'Perros', quantity: 34),
                      sizedBox10,
                      buildMenuItem(title: 'Albergues', quantity: 25),
                      sizedBox10,
                      buildMenuItem(title: 'Donativos', quantity: 50),
                      sizedBox10,
                    ],*/
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
