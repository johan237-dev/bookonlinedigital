import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'auth.dart';

class Login extends StatefulWidget {
  const Login({super.key, required title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool _isloading = false;
  bool _forlogin = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(

        elevation: 2,
        centerTitle: true,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key:formKey ,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 380,
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
                            child: Image.network(
                              'images/image/run.png',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  TextFormField(


                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                      labelText: "Email",
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty ){
                        return "Email incorrect try again";

                      }
                      return null;
                    },
                    controller: emailController,


                  ),
                  const SizedBox(height: 18),
                  TextFormField(

                    obscureText: _isVisible,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black45,
                      ),


                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisible =! _isVisible;
                            });
                          },
                          icon:Icon(_isVisible? Icons.visibility_off:Icons.visibility)
                      ),
                      labelText: "password",
                      hintText: "Enter your password",
                      border: const OutlineInputBorder(),
                      ),
                    validator: (value){
                      if(value == null || value.isEmpty ){
                        return "password incorrect try again";

                      }
                      return null;
                    },
                    controller: passwordController,


                  ),
                  const SizedBox(height: 10),
                  if(!_forlogin) TextFormField(
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isVisible =! _isVisible;
                            });
                          },
                          icon:Icon(_isVisible? Icons.visibility_off:Icons.visibility)
                      ),
                      labelText: "password Confirmation",
                      hintText: "Enter your password",
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value != passwordController.text ){
                        return "two password are not the same";

                      }
                      return null;
                    },
                    controller: passwordConfirmController,


                  ),
                  const SizedBox(height: 18),

                  Container(
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,

                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          backgroundColor: WidgetStateProperty.all(Colors.lightBlue)
                      ),
                      onPressed:_isloading? null :() async {


                        if(formKey.currentState!.validate()){
                          setState(() {
                            _isloading = true;
                          });
                          // LOGIN
                          try{
                            if(_forlogin){
                              await Auth().loginWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text
                              );
                            }else{
                              await Auth().createUserwithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text
                              );
                            }

                          } on FirebaseAuthException catch(e){
                            // Message d'erreur
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${e.message}"),
                                behavior: SnackBarBehavior.floating,
                              ),

                            );

                          }
                        }
                      },

                      child: _isloading ?  const CircularProgressIndicator():
                      Text(_forlogin?"Se connecter a LIREO": "S'inscrire",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),



                  ),
                  const SizedBox(height: 11),
                  TextButton(

                      onPressed: (){
                        setState(() {
                          _forlogin = ! _forlogin;
                        });
                      },
                      child: Text(_forlogin? "Pas de compte? S'inscrire":"Deja un compte? Se connecter ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      )
                  )

                ],


              )
          ),
        ),
      ),
    );
  }
}
