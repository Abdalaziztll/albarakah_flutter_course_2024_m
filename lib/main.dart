import 'package:flutter/material.dart';
import 'package:responsive_ui_and_api/config/get_it_config.dart';
import 'package:responsive_ui_and_api/view/login_page.dart';
import 'package:responsive_ui_and_api/view/quiz_app.dart';
import 'package:responsive_ui_and_api/view/ui_with_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

late double width;
late double height;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    
    return MaterialApp(
        // home: LayoutBuilder(builder: (context, screeninfo) {
        //   if (screeninfo.maxWidth < 300) {
        //     return MobileHomePage();
        //   } else {
        //     return TabletHomePage();
        //   }
        // }),
        home: (core.get<SharedPreferences>().getString('name') == null)
            ? LogInPage()
            : QuizApp());
  }
}

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width / 2,
              child: TextField(
                onChanged: (value) {
                  core.get<SharedPreferences>().setString('lexem', value);
                },
              ),
            ),
            Text(MediaQuery.of(context).size.width.toString())
          ],
        ),
      ),
    );
  }
}

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      core.get<SharedPreferences>().getString('lexem') ??
                          'Hello World'),
                );
              },
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              height: 1000,
              color: Colors.red,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Flexible(
            flex: 4,
            child: Container(
              height: 500,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
