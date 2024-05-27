import 'package:flutter/material.dart';
import 'package:responsive_ui_and_api/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(core.get<SharedPreferences>().getString('name')?? ''),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () {
            core.get<SharedPreferences>().setString('name', name.text);

            core.get<SharedPreferences>().setString('pass', password.text);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelloPage(),
                ));
          },
          child: Icon(Icons.send)),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Hello Mr.${core.get<SharedPreferences>().getString('name')}"),
      ),
    );
  }
}
