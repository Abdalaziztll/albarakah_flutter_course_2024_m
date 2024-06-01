// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_full_example/pages/example.dart';
import 'package:state_full_example/pages/homepage.dart';
import 'package:state_full_example/pages/login_page.dart';
import 'package:state_full_example/pages/navigation_pages.dart';
import 'package:state_full_example/pages/order_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: OrderdList(),
      // bottomNavigationBar: NavigationBar(
      //     labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //     backgroundColor: Colors.grey.shade400,
      //     animationDuration: Duration(seconds: 4),
      //     selectedIndex: selectedPage,
      //     onDestinationSelected: (value) {
      //       setState(() {
      //         selectedPage = value;
      //       });
      //     },
      //     destinations: [
      //       NavigationDestination(
      //         selectedIcon: Icon(Icons.flag),
      //         icon: Icon(Icons.outlined_flag),
      //         label: 'HomePage',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.home),
      //         label: 'Person',
      //       ),
      //       NavigationDestination(
      //           icon: Icon(Icons.notification_add), label: 'Notification'),
      //     ]),
    ));
  }
}
