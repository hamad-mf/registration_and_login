import 'package:flutter/material.dart';
import 'package:registration_and_login/View/Login%20Screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cnfmpassController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  final _PassKey = GlobalKey<FormState>();
  final _CpassKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                Text(
                  "Sign Up for Free",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _FormKey,
                  child: TextFormField(
                    controller: emailController,
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
                      if (emailController.text.isEmpty ||
                          !emailController.text.contains("@")) {
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
                  key: _PassKey,
                  child: TextFormField(
                    controller: passController,
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
                      if (passController.text.isEmpty ||
                          passController.text.length < 6) {
                        return "Enter a valid text";
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
                  key: _CpassKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text("Confirm Password"),
                      hintText: "Your Confirm Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid password";
                      } else if (value != passController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool isEmailValid = _FormKey.currentState!.validate();
                    bool isPassValid = _PassKey.currentState!.validate();
                    bool isCPassValid = _CpassKey.currentState!.validate();
                    if (isEmailValid && isPassValid && isCPassValid) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                  email: emailController.text,
                                  password: passController.text)));
                      setState(() {});
                    }
                  },
                  child: Text("Sign Up"),
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
                    Text("Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                      email: emailController.text,
                                      password: passController.text,
                                    )));
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
