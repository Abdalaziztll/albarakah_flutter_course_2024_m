import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui_and_api/model/proucts_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(snapshot.data![index].thumbnail)
                              .image)),
                  child: Text(snapshot.data![index].title),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<List<ProductModel>> getProducts() async {
  Dio req = Dio();

  Response response = await req.get('https://dummyjson.com/products');

  List<ProductModel> products = List.generate(
    response.data['products'].length,
    (index) => ProductModel.fromMap(response.data['products'][index]),
  );
  return products;
}

class ProductPageWithValueNotifier extends StatelessWidget {
  ProductPageWithValueNotifier({super.key});

  ValueNotifier<List<ProductModel>> products = ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: products,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(value[index].thumbnail),
                title: Text(value[index].title),
              );
            },
          );
        },
      ),
      floatingActionButton: InkWell(
          onTap: () async {
            products.value = await getProducts();
          },
          child: Icon(Icons.get_app)),
    );
  }
}
