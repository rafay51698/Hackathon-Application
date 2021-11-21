import 'package:flutter/material.dart';
import 'package:hackathonapp/login/decoration.dart';
import 'package:hackathonapp/login/signup.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';

import 'package:hackathonapp/screens/home.dart';
import 'package:hackathonapp/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: prefer_typing_uninitialized_variables
  var userpass;
  // ignore: prefer_typing_uninitialized_variables

  var orgpass = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: primary,
        title: Text(
          'Login',
          style: const TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              animation(),
              const SizedBox(
                height: 20,
              ),
              SimpleTextField('Username'),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: (TextField(
                  onChanged: (password) {
                    userpass = password;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(width: 3, color: primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 110,
                decoration: deco(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (userpass == orgpass) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingPage()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("Incorrect Password"),
                                content: Text("Please Try Again"),
                              );
                            });
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.login,
                        color: primary,
                      ),
                      Text(
                        " Login",
                        style: TextStyle(color: primary),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: Text(
                  "Don't have an account? Signup",
                  style: TextStyle(color: primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SimpleTextField(label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      child: (TextField(
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: primary),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(width: 3, color: primary),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      )),
    );
  }
}

Widget animation() {
  return Container(
    margin: const EdgeInsets.only(top: 20, bottom: 20),
    child: Image.asset(
      'assets/gif.gif',
      height: 200,
      width: 300,
    ),
  );
}
