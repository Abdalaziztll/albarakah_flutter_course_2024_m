import 'package:flutter/material.dart';
import 'package:navigation_and_drawer_with_best_ui/config/get_it_config.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridExample(),
    );
  }
}

ValueNotifier<int> counter = ValueNotifier(0);

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text("Abdalziz"),
              accountEmail: Text(
                "abdalaziztll992010@gmil.com",
              ),
            ),
            ListTile(
              title: Text("Hello"),
              subtitle: Text("Wolrd"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.draw));
          })
        ],
        title: Text("Log in Page"),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => core.get<HomePage>()),
            );
            counter.value++;
          },
          child: ListTile(
            leading: Hero(tag: 'animate', child: FlutterLogo()),
            title: Text(core.get<DateTime>().second.toString()),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage._internal();

  static final page = HomePage._internal();

  factory HomePage() {
    return page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogInPage(),
              ),
            );
            counter.value++;
          },
          child: Text(
            "Home Page " + core.get<DateTime>().second.toString(),
          ),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: 'animate',
            child: FlutterLogo(
              size: 300,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, _) {
              return Text(value.toString());
            },
          )
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () {
            counter.value++;
          },
          child: Icon(Icons.add)),
    );
  }
}

// ? Notify
// ? Stream
// ? Observer

class DemoOfFlutter extends StatelessWidget {
  DemoOfFlutter({super.key});
  ValueNotifier<int> newCounter = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Demo of Flutter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed the button : "),
            ValueListenableBuilder(
              valueListenable: newCounter,
              builder: (context, value, child) {
                return Text(value.toString());
              },
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          newCounter.value++;
        },
        child: CircleAvatar(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
        children: [
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),
          FlutterLogo(),FlutterLogo()
        ],
      ),
    );
  }
}
