// ! : Relative Path is Better Than Package Path
import 'package:clean_service_layter/provider/cat_favorite.dart';
import 'package:provider/provider.dart';

import './model/animal_model.dart';

// ? This is A Package Path
import 'package:clean_service_layter/model/cat_model.dart';
import 'package:clean_service_layter/model/handling.dart';
import 'package:clean_service_layter/service/animal_service.dart';
import 'package:clean_service_layter/service/cat_service.dart';
import 'package:clean_service_layter/shared_method.dart';
import 'package:flutter/material.dart';

void main() {
  List<String> name = ["AHmad", "Mhd"];
  for (var i = 0; i < name.length; i++) {
    print(name[i]);
  }

  name.forEach((e) {
    print(e);
  });

  //? Intro to Funcitional Paradaigm

  // printer(String name) {
  //  final int i = name.length;
  //   if (i == 0) {
  //     return null;
  //   }

  //   printer(name[i - 1]);
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatFavorite(),
      child: MaterialApp(
        home: HomePageWithList(),
      ),
    );
  }
}

class HomePageWithList extends StatelessWidget {
  HomePageWithList({super.key});

  final ValueNotifier<ResultModel> result = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ));
            },
            child: Icon(Icons.navigate_next)),
      ),
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is ListOf<CatModel>) {
            return ListView.builder(
              itemCount: value.data.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Provider.of<CatFavorite>(context, listen: false)
                      .addCat(value.data[index]);
                },
                leading: Image.network(
                  value.data[index].image,
                  errorBuilder: (context, error, stackTrace) {
                    return FlutterLogo();
                  },
                ),
                title: Text(value.data[index].name),
              ),
            );
          } else if (value is ErrorModel) {
            return const Center(
                child: Text("There is a problem in your connection"));
          } else if (value is ExceptionModel) {
            return Center(child: Text(value.message));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await CatServiceImp().getAllCat();
      }),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CatFavorite>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.favoriteCat.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text(value.favoriteCat.elementAt(index).name),
                subtitle: Text(value.favoriteCat.elementAt(index).origin),
              );
            },
          );
        },
      ),
    );
  }
}
