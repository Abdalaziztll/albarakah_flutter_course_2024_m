import 'package:flutter/material.dart';
import 'package:search_tabs_etc/config/get_it_config.dart';
import 'package:search_tabs_etc/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              List<String> products =
                  core.get<SharedPreferences>().getStringList('product') ?? [];
              products.add(productModel.toJson());
              core.get<SharedPreferences>().setStringList('product',products);
            },
            child: Icon(Icons.save)),
      ),
      body: Column(
        children: [
          Hero(
              tag: productModel.id,
              child: Image.network(productModel.thumbnail)),
          ListTile(
            title: Text(productModel.name),
            subtitle: Text(productModel.price.toString()),
            trailing: Text(productModel.rating.toString()),
          )
        ],
      ),
    );
  }
}
