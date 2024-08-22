import 'package:flutter/material.dart';
import 'package:registration_and_login/View/Home%20Screen/home_screen.dart';
import 'package:registration_and_login/View/Registration%20Screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  final String email;
  final String password;

  LoginScreen({required this.email, required this.password, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpass = TextEditingController();

  final _LoginEmailKey = GlobalKey<FormState>();
  final _LoginPassKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  "Sign in to Your Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _LoginEmailKey,
                  child: TextFormField(
                    controller: loginemail,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Your Email Address",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (loginemail.text.isEmpty ||
                          loginemail.text != widget.email) {
                        return "Enter a valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _LoginPassKey,
                  child: TextFormField(
                    controller: loginpass,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Your Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (loginpass.text != widget.password) {
                        return "wrong password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      fillColor: WidgetStatePropertyAll(Colors.black),
                      checkColor: Colors.white,
                    ),
                    Text(
                      "Forgot Password",
                      style:
                          TextStyle(color: Color.fromARGB(255, 13, 118, 205)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool IsEmailCorrect =
                        _LoginEmailKey.currentState!.validate();
                    bool IsPassCorrect = _LoginPassKey.currentState!.validate();
                    if (IsEmailCorrect && IsPassCorrect) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                  child: Text("Sign In"),
                  style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      minimumSize: WidgetStatePropertyAll(Size(360, 55)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                ),
                SizedBox(
                  height: 280,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
