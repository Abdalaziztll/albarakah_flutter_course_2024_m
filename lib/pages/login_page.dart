import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey<FormState> Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: Formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.length < 5) {
                      return 'Your Password is Weak';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    RegExp validateEmail = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (validateEmail.hasMatch(value!)) {
                      return "This is A correct email";
                    } else {
                      return "This Email not Valid";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (Formkey.currentState!.validate()) {
                        print("yes");
                      } else {
                        print("no");
                      }
                    },
                    icon: Icon(Icons.send))
              ],
            )),
      ),
    );
  }
}
