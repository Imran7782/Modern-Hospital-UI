import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhospital/hompage.dart';
import 'package:myhospital/main.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Image.asset(
                    "assets/images/cricle.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 170),
                  child: Image.asset("assets/images/circlePink.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 200),
                  child: Image.asset("assets/images/Rectangle 1.png"),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Let's Sign UP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
               
                Padding(
                  padding: EdgeInsets.only(top: 300, left: 40, right: 40),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(top: 370, left: 40, right: 40),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.only(top: 480, left: 90),
                  child: GestureDetector(
                    onTap: () async {
                      print("New user was Sign Up");
                      dynamic user = await registerWithEmail(
                          _emailcontroller.text, _passwordcontroller.text);
                      if (user != null) {
                        print(user.uid);
                         // Navigate to HomePage1
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage1()));
                      } else {
                        print("Error detected");
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Align(
                    child: Padding(
                      padding: EdgeInsets.only(top: 560, left: 20),
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
Future<String?> registerWithEmail(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user?.uid; // Returning the UID as a String
  } catch (e) {
    print("Unknown error occurred: $e");
    return null; // Return null in case of an error
  }
}
}
