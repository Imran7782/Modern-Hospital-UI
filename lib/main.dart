
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myhospital/hompage.dart';
import 'package:myhospital/signup.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is fully initialized
  await Firebase.initializeApp(); // Initializes Firebase
  runApp(Hospital());
}


class Hospital extends StatelessWidget {
  const Hospital({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailcontroller=new TextEditingController();
  TextEditingController _passwordcontroller=new TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  String email='';
  @override
  Widget build(BuildContext context) {
    // Check MediaQuery here to avoid null reference
    Size size = MediaQuery.of(context).size;
   

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            // Ensure that all elements have valid size constraints
            SizedBox(
              height: size.height, // Use size.height to constrain height
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      "assets/images/cricle.png",
                      width: size.width,
                      height: size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    width: 550,
                    height: 450,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 170),
                      child: Image.asset(
                        "assets/images/Group 1.png",
                        width: size.width,
                        height: size.height * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 300, left: 30),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/circlePink.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, top: 350, left: 30),
                      child: Image.asset(
                        "assets/images/Rectangle 1.png",
                        width: size.width,
                        height: size.height * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Move the text outside the Stack so it remains visible
                  Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 30, top: 10),
                          child: Text(
                            "Welcome Back 🌻",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 55),
                          child: TextField(
                            controller: _emailcontroller,
                            onChanged: 
                            (value) {
                              setState(() {
                                email=value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: "Email",
                              filled: true,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Icon(Icons.email),
                              fillColor: Color.fromARGB(255, 255, 254, 254),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, right: 55),
                          child: TextField(
                            controller: _passwordcontroller,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              suffixIcon: Icon(Icons.remove_red_eye),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              fillColor: Color.fromARGB(255, 255, 254, 254),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  const Align(
                    child: Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Text(
                        "Forgot your Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
          Padding(
  padding: EdgeInsets.only(top: 600, left: 90),
  child: GestureDetector(
    onTap: () async {
      print("Attempting to log in");
      String? userId = await loginwithemaill(
          _emailcontroller.text, _passwordcontroller.text);
      if (userId != null) {
        print("User ID: $userId");
        // Navigate to HomePage1
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage1()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed. Please check your email and password ."),
          backgroundColor: const Color.fromARGB(255, 142, 121, 146),
          duration: Duration(
            seconds: 5
          ),
          showCloseIcon: true,
          closeIconColor: Colors.black,
          ),
        );
      }
    },
    child: Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Login",
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

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder:(context) => Signup1(), ));
                    },
                  child:const Padding(
                    padding: EdgeInsets.only(top: 670, left:35, right:18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Don' have account\n         Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                 ),
                  Padding(
                    padding: EdgeInsets.only(top: 725, left: 120),
                    child: GestureDetector(
                      onTap: () {
                        // Add your tap functionality here
                      },
                      child: Container(
                        height: 35,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 1),
                              child: Image.asset(
                                "assets/images/google.png",
                                fit: BoxFit.contain, // Ensure the image fits within the container
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Login with Google ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
            ),
          ],
        ),
      ),
    );
  }

Future<String?> loginwithemaill(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user?.uid; // Returning the UID as a String
  } catch (e) {
    print("Unknown error occurred: $e");
    return null; // Return null in case of an error
  }
}
}
