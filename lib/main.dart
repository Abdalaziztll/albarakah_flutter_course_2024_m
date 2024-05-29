import 'package:flutter/material.dart';
import 'package:post_request_with_dio/config/get_it_config.dart';
import 'package:post_request_with_dio/model/login_model.dart';
import 'package:post_request_with_dio/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (core.get<SharedPreferences>().getString('token') == null)
            ? LoginPage()
            : HomePage());
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();
  // ? shimmer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            bool status = await LoginServiceImp().logIn(
                LoginModel(username: username.text, password: password.text));

            if (status) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Error in Login"),
                backgroundColor: Colors.red,
              ));
            }
          },
          child: Icon(Icons.send)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                core.get<SharedPreferences>().clear();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
            core.get<SharedPreferences>().getString('token') ?? "Helo World"),
      ),
    );
  }
}
