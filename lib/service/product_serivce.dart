import 'package:dio/dio.dart';
import 'package:search_tabs_etc/model/product_model.dart';

abstract class Service {
  Dio dio = Dio();
  String baseurl = "https://dummyjson.com/products";
  late Response response;

  Future<List<ProductModel>> getProduct();
}

class ProductSerivceImp extends Service {
  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      response = await dio.get(baseurl);
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<ProductModel> products = List.generate(
          response.data['products'].length,
          (index) => ProductModel.fromMap(response.data['products'][index]),
        );
        return products;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
