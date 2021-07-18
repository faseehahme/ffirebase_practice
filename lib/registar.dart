import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

try {
        await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print("username: " + username);
    }
  

}



    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Enter your Username"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Enter your Email"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Enter your Password"),
              ),
              Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(onPressed: register, child: Text("Register"))
            ],
          ))),
    );
  }
}
