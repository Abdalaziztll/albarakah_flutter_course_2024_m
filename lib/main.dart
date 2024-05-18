import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const HomePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(),
          actions: [FlutterLogo(), Text("data"), FlutterLogo()],
          centerTitle: true,
          title: Text('Hello World'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(
              color: Colors.green,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Text("Hello"),
          width: 200,
          height: 200,
          // color: Colors.red,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Netherlan >> NL-Frer5435435"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Ip:321321321",
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 22),
                  ),
                  Text(
                    "49% Load",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Container(
                
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text("data"),
                ),
                width: 312,
                height: 50,
                decoration: BoxDecoration(

                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15)),
              )
            ]),
      ),
    );
  }
}
