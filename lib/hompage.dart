import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhospital/main.dart';
import 'firstoreactions.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<HomePage1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreActions a = FirestoreActions(); // Create an instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 179, 134, 187),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                "Welcome to the Home Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 200),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    signOut();
                    print("Signed out successfully!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 179, 134, 187),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    try {
                      await a.insert('heklo', 2222, 'modern');
                    } catch (e) {
                      print("Error inserting data: $e");
                    }
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text("Click me to add something to Firebase database!"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
