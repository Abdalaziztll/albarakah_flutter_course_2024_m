import 'package:flutter/material.dart';

class ListWheeeeelPage extends StatelessWidget {
  const ListWheeeeelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
          // useMagnifier: true,
          // magnification: 2,
          // offAxisFraction: 0.9,
          // diameterRatio: 2,
          // squeeze: 2,
          clipBehavior: Clip.none,
          renderChildrenOutsideViewport: true,
          itemExtent: 50,
          children: List.generate(
            20,
            (index) => Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text("Hello ${index}")),
            ),
          )),
    );
  }
}
