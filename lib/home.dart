

import 'dart:ui';



import 'package:bookonlinedigital/explanations.dart';


import 'package:bookonlinedigital/livresTleC.dart';
import 'package:bookonlinedigital/livresTleD.dart';
import 'package:bookonlinedigital/message.dart';



import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';






import 'auth.dart';
import 'livres1ereA.dart';
import 'livres1reC.dart';
import 'livres1reD.dart';
import 'livres2ndeA.dart';
import 'livres2ndeC.dart';
import 'livres3eme.dart';
import 'livres4eme.dart';
import 'livres5eme.dart';
import 'livres6eme.dart';
import 'livresTleA.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required String title});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? selectedPage;





  final User? user = Auth().currentUser;
final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [


        ],





      ),
      drawer:Drawer(
        backgroundColor: Colors.white,


        child: ListView(
          children: [
             DrawerHeader(
              decoration:  BoxDecoration(
                color: Colors.blue[100],
              ),
                child: const Center(),

            ),
              const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                     TextButton.icon(

                       onPressed: (){
                       Navigator.pop(context);
                     },
                         icon: const Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Icon(Icons.house,
                             size: 30,
                             color: Colors.black,),
                           ],
                         ),
                       label: const Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text("Acceuil",

                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 28,
                             color: Colors.black

                           ),
                           ),
                         ],
                       ),
                       iconAlignment: IconAlignment.start,

                     ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                         TextButton.icon(
                           iconAlignment: IconAlignment.start,
                             onPressed: (){
                           showDialog(context: context,
                               builder: (BuildContext context){

                                 return  AlertDialog(

                                   content: Column(
                                     children: [

                                       const SizedBox(height: 10),

                                       Row(
                                         children: [
                                           const Text("nom:",
                                             style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 24,
                                                 color: Colors.black

                                             ),
                                           ),
                                           const SizedBox(width: 1),
                                           Text(user?.email ?? "user email",
                                             style: const TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 24,
                                                 color: Colors.black

                                             ),
                                           ),
                                         ],
                                       ),
                                       const SizedBox(height: 14),
                                       const Text("Statut: Connecté(e)",
                                         style: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 24,
                                             color: Colors.black

                                         ),
                                       )
                                     ],
                                   ),

                                 );

                               });

                         },
                             icon: const Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(Icons.person,
                                 size: 30,
                                 color: Colors.black,),
                               ],
                             ),


                             label:const Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Profil",
                                 style: TextStyle(
                                   fontSize: 26,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black
                                 ),),
                               ],
                             )
                         ),

                          const SizedBox(height: 30),
                          Column(
                            children: [
                              TextButton.icon(
                                  onPressed:(){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>ChatPage()));

                                  },
                                  icon: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.message,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Nous écrire",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                          const SizedBox(height: 30),

                          Column(
                            children: [
                              TextButton.icon(
                                  onPressed:()async{
                                    await Auth().logout();


                                  },
                                  icon: const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.logout,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Deconnexion",
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ],
            )
           


          ],
        ),
      ),

      body:     Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 170,
                width: 800,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: Colors.white
                  ),

                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'images/image/run.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),


               const SizedBox(

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 19,horizontal: 25),
                  child: Center(
                    child: Text("BIENVENUE SUR LIREO,VOTRE APPLICATION MOBILE QUI VOUS ACCOMPAGNE SUR "
                        "TOUTES VOS RECHERCHES DE LIVRES EN UN CLICK.",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,


                    ) ,
                    ),
                  ),
                ),
              ),
              Image.network("data:image/jpeg;base64,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",
              height: 275,
              width: 450,
              fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(

                    height: 70,
                    width: 200,

                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8)
                    ),
                    
                    child: Center(
                      child: DropdownButton<String>(
                        isExpanded: true,

                        dropdownColor: Colors.blue[100],
                        style:  const TextStyle(
                          color: Colors.white,

                        ),


                        hint: const Center(
                          child: Text("CLASSES",


                          style: TextStyle(

                            fontWeight: FontWeight.bold,
                            fontSize: 28,

                            color: Colors.black,


                          ),
                          ),
                        ),
                        value: selectedPage,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedPage = newValue;
                          });
                          if(newValue == "6eme"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres6eme()));
                          }
                          if(newValue == "5eme"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres5eme()));
                          }
                          if(newValue == "4eme"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres4eme()));
                          }
                          if(newValue == "3eme"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres3eme()));
                          }
                          if(newValue == "2ndeA4"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres2ndeA()));
                          }
                          if(newValue == "2ndeC"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres2ndeC()));
                          }
                          if(newValue == "1ereA4"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres1reA()));
                          }
                          if(newValue == "1ereD"){

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres1reD()));
                          }
                          if(newValue == "1ereC"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Livres1reC()));
                          }
                          if(newValue == "TleA4"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>LivresTleA()));
                          }
                          if(newValue == "TleD"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> LivresTleD()));
                          }
                          if(newValue == "TleC"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> LivresTleC()));
                          }

                        },
                        items:<String>["6eme","5eme","4eme","3eme","2ndeA4","2ndeC","1ereA4",
                        "1ereD","1ereC","TleA4","TleD","TleC"].map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                          );
                        }).toList()


                          ),
                    )
                  ),
                  Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),

                    ),
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all( RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)

                          )
                          ),
                            backgroundColor: WidgetStateProperty.all(Colors.brown,
                            )
                                
                        ),
                        onPressed:(){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const Explanations()));
                        },
                        child: const Text("A propos",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  )


                ],
              )










            ],
          ),
        ),

      ),
    );
  }
}
