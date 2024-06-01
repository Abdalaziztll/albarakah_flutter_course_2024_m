

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int coutner = 0;
  bool isChecked = false;
  double width = 300;
  double height = 100;
  Color color = Colors.red;
  double padding = 8;
  double opic = 1;
  double score = 0.0;

  @override
  void initState() {
    // Future.delayed(
    //   Duration(seconds: 3),
    //   () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => Scaffold(
    //             appBar: AppBar(),
    //           ),
    //         ));
    //   },
    // );
  }

  // @override
  // void dispose() {
  //   print("Hello World");
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          CheckboxListTile(
            selectedTileColor: Colors.green,
            selected: isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            secondary: CircleAvatar(),
            title: Text("Hello World"),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 3),
            opacity: opic,
            child: AnimatedPadding(
              padding: EdgeInsets.only(left: padding),
              duration: Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                width: width,
                height: height,
                color: color,
              ),
            ),
          ),
          LinearProgressIndicator(
            value: score,
          )
        ],
      )),
      floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              // double temp = width;
              // width = height;
              // height = temp;
              if (color == Colors.red) {
                color = Colors.green;
              } else {
                color = Colors.red;
              }
              padding = padding + 30;
              opic = 0;
              score += 0.1;
            });
            // setState(() {
            //   coutner++;
            //   print(coutner);
            // });
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Scaffold(
            //         appBar: AppBar(),
            //       ),
            //     ));
          },
          child: Icon(Icons.add)),
    );
  }
}
