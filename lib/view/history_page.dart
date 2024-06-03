import 'package:flutter/material.dart';
import 'package:search_tabs_etc/config/get_it_config.dart';
import 'package:search_tabs_etc/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  List<ProductModel> product = List.generate(
    core.get<SharedPreferences>().getStringList('product')!.length,
    (index) => ProductModel.fromJson(
        core.get<SharedPreferences>().getStringList('product')![index]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              core.get<SharedPreferences>().clear();
            },
            child: Text("delete")),
      ),
      body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(product[index].thumbnail),
              subtitle: Text(product[index].price.toString()),
              title: Text(product[index].name),
            );
          }),
    );
  }
}
