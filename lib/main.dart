import 'package:flutter/material.dart';
import 'package:search_tabs_etc/config/get_it_config.dart';
import 'package:search_tabs_etc/model/product_model.dart';
import 'package:search_tabs_etc/service/product_serivce.dart';
import 'package:search_tabs_etc/view/details_page.dart';
import 'package:search_tabs_etc/view/history_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: 'Hello',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Hello',
            ),
            Tab(
              icon: Icon(Icons.person),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              backgroundColor: Colors.red,
            ),
            Scaffold(
              backgroundColor: Colors.blue,
            ),
            SearchPage()
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  List<ProductModel> result = [];
  List<ProductModel> history = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Icon(Icons.notification_add),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hello",
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Start with Laza",
              style: TextStyle(fontSize: 18),
            ),
          ),
          FutureBuilder(
            future: ProductSerivceImp().getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                result = snapshot.data!;
                return StatefulBuilder(builder: (context, setstate) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                onChanged: (value) {
                                  result = [];
                                  for (var i = 0;
                                      i < snapshot.data!.length;
                                      i++) {
                                    if (value == '') {
                                      result = history;
                                    } else {
                                      if (snapshot.data![i].name
                                          .contains(value)) {
                                        result.add(snapshot.data![i]);
                                      }
                                    }
                                  }
                                  setstate(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                history = result;
                              },
                              child: Icon(Icons.search))
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.builder(
                          itemCount: result.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          productModel: result[index]),
                                    ));
                              },
                              child: Hero(
                                tag: result[index].id,
                                child: Container(
                                  child:
                                      Center(child: Text(result[index].name)),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Image.network(
                                                result[index].thumbnail)
                                            .image),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                });
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    LinearProgressIndicator(),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
