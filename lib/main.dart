import 'package:easy_local_and_jwt_token/config/core_config.dart';
import 'package:easy_local_and_jwt_token/config/res/app_string.dart';
import 'package:easy_local_and_jwt_token/model/user_model.dart';
import 'package:easy_local_and_jwt_token/service/user_serivce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('ar'),
          Locale('en'),
        ],
        path:
            'assets/translate', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: LogInPage());
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                if (context.locale.languageCode == 'ar') {
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              child: Icon(Icons.translate))
        ],
        title: Text(AppString().HELLOWORLD),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                bool status = await UserServiceImp().logIn(UserModel(
                    username: username.text, password: password.text));

                if (status) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoPage(),
                      ));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(AppString().ERROR)));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade300,
                ),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    AppString().SEND,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FlutterLogo(),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: UserServiceImp().getMyInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListTile(
              leading: Image.network(
                snapshot.data!.image,
                errorBuilder: (context, error, stackTrace) {
                  return FlutterLogo();
                },
              ),
              subtitle: Text(snapshot.data!.username),
              title: Text(snapshot.data!.firstName),
            );
          } else {
            return Center(child: Text("No internet or you are not Authorized"));
          }
        },
      ),
    );
  }
}
