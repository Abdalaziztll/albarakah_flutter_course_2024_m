
import 'package:clean_service_layter/model/handling.dart';
import 'package:clean_service_layter/service/animal_service.dart';
import 'package:clean_service_layter/shared_method.dart';
import 'package:flutter/material.dart';

import '../model/animal_model.dart';
import '../model/cat_model.dart';
import '../service/cat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<ResultModel> result = ValueNotifier(ResultModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: result,
        builder: (context, value, child) {
          if (value is CatModel) {
            return Center(child: Text(value.name));
          } else if (value is ErrorModel) {
            return Center(child: Text("There is a problem in your connection"));
          } else if (value is ExceptionModel) {
            return Center(child: Text(value.message));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        result.value = await CatServiceImp().getCat();
      }),
    );
  }
}

class AnimalAdditionPage extends StatelessWidget with SharedMethod {
  AnimalAdditionPage({super.key});

  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                ResultModel status = await AnimalServiceImp()
                    .createNewAnimal(AnimalModel(name: name.text));

                switch (status) {
                  case SuccessModel(message: ''):
                    showSnackBar(
                      context: context,
                      title: status.message,
                      color: Colors.green,
                    );
                  case ExceptionModel(message: ''):
                    showSnackBar(
                      context: context,
                      title: status.message,
                      color: Colors.blue,
                    );
                  default:
                    showSnackBar(
                      context: context,
                      title: (status as ErrorModel).message,
                      color: Colors.red,
                    );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
