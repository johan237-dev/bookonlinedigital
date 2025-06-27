import 'package:flutter/material.dart';

class Explanations extends StatelessWidget {
  const Explanations({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: const Text("FONCTIONNALITES DE LIREO"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              Column(
                children: [
                  Text("LIREO est une application éssentiellement mobile utilisable sur"
                      " android et ios crée par "
                      " des développeurs mobiles a partir du framework flutter dans le but d'aider la "
                      "population camerounaise dans le domaine de l'éducation au Cameroun."
                      " A cet éffet,cette application a pour but d'aider les élèves "
                      "et les parents a avoir connaissance des manuels scolaires "
                      "au programme  dans les classes de "
                      "l'enseignement secondaire géneral au Cameroun. Cette application peut avoir "
                      "un impact immense car a notre humble connaissance,"
                      "les applications mobiles allant dans cette optique sont"

                      " quasi inéxistantes au Cameroun. C'est donc a partir de cela que "
                      "nous avons pris la responsabilité de mettre  "
                      "sur pied cette application qui va changer selon nous la vision éducative de la"
                      " population camerounaise."

                      ,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
                  SizedBox(height: 5),
                  Text("Les fonctionnalités de LIREO sont les suivantes:",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5),
              Text("- Consultation des manuels au programme",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black
                    ),
                  ),

              SizedBox(height: 5),
              Text("   - Prévisualisation des manuels pour la lecture",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 5),
              Text("   - Moteur de recherche des manuels au programme.",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 5),
              Text("En somme LIREO est une application qui espérons "
                  "le aura sa place dans le développement du système éducatif"
                  " camerounais.",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),


            ],
          ),
        ) ,
      ),
    );
  }
}
