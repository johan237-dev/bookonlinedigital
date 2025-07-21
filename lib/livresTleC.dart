import 'package:bookonlinedigital/pdfpage.dart';
import 'package:bookonlinedigital/pdfviewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class LivresTleC extends StatelessWidget {
  LivresTleC({super.key});
  final CollectionReference livresTleC = FirebaseFirestore.instance.collection("LivresTleC");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Livres de la classe de TleC",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black

            ),),
          elevation: 17,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:StreamBuilder(
              stream: FirebaseFirestore.instance.collection("LivresTleC").snapshots(),
              builder:(BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                if(!snapshot.hasData){
                  return const Text("Aucun livre trouvé");
                }
                final data = snapshot.data;
                return ListView.builder(
                  itemCount: data!.docs.length,
                  itemBuilder: (context,index){
                    final doc = data.docs[index];
                    final titre = doc['titre']?? "Titre inconnu";
                    final editeur = doc['editeur'] ?? "Auteur inconnu";
                    final prix = doc['prix']?? "Prix inconnu";
                    final image = doc['image']?? '';


                    return Container(
                        width: 100,
                        height: 100,

                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: image.isNotEmpty? GestureDetector(
                              onTap: (){
                                showDialog(context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        content: Column(
                                          children: [
                                            Image.network(image,width: 200,height: 300,fit: BoxFit.cover,),
                                            const SizedBox(height: 20),

                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: WidgetStateProperty.all(Colors.blue)
                                                ),
                                                onPressed: () async {
                                                  if (kIsWeb) {
                                                    html.window.open('assets/maths.pdf', '_blank');
                                                  } else {
                                                    // Appel à Pdfpage et navigation vers Pdfviewpage pour Android/iOS
                                                  }
                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (_) => const Center(child: CircularProgressIndicator()),
                                                  );
                                                  try {
                                                    final file = await Pdfpage.loadPdfFromAsset('assets/asset/maths.pdf');
                                                    Navigator.pop(context); // Ferme le loader
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (_) => Pdfviewpage(file: file)
                                                        )
                                                    );
                                                  } catch (e) {
                                                    Navigator.pop(context); // ferme le dialog en cas d'erreur
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) => AlertDialog(
                                                        title: Text("Erreur"),
                                                        content: Text("$e"),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(context),
                                                            child: const Text("OK"),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: const Text("Lire",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black
                                                  ),)
                                            )
                                          ],
                                        ),
                                      );

                                    });
                              },


                              child: SizedBox(
                                  width: 90,
                                  height: 100,
                                  child: Image.network(image, width: 90, height: 90, fit: BoxFit.cover))):
                          Container(width: 50, height: 50, color: Colors.grey),
                          title: Text('Titre:$titre',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text('Editeur: $editeur\nPrix: $prix XAF',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                        )
                    );
                  },
                );
              }
          ),
        )

    );
  }
}
