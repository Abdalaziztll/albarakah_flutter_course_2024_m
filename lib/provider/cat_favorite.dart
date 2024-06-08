import 'package:clean_service_layter/model/cat_model.dart';
import 'package:flutter/material.dart';

class CatFavorite extends ChangeNotifier {
  // List<CatModel> favoriteCat = [];
  Set<CatModel> favoriteCat = {};

  addCat(CatModel cat) {
    // if (favoriteCat.isNotEmpty) {
    //   favoriteCat.forEach(
    //   (element) {
    //     if (cat.name != element.name) {
    //       favoriteCat.add(cat);
    //     }
    //   },
    // );
    // }

    favoriteCat.add(cat);

    notifyListeners();
  }

  removeAll() {
    favoriteCat.clear();
    notifyListeners();
  }
}
