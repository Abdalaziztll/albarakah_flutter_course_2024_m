import 'package:flutter/material.dart';

class OrderdList extends StatefulWidget {
  const OrderdList({super.key});

  @override
  State<OrderdList> createState() => _OrderdListState();
}

List<String> names = ["Ahmad", "Noor", "Yaser", "Kamal"];

class _OrderdListState extends State<OrderdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView.builder(
        itemBuilder: (context, index) => ListTile(
          key: GlobalKey(),
          title: Text(names[index]),
        ),
        itemCount: names.length,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex= newIndex - 1;
          }
          String temp = '';
          temp = names.removeAt(oldIndex);
          names.insert(newIndex, temp);
          setState(() {});
          print(oldIndex);
          print(newIndex);
        },
      ),
    );
  }
}
