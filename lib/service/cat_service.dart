import 'package:dio/dio.dart';
import 'package:clean_service_layter/model/handling.dart';
import 'package:clean_service_layter/model/cat_model.dart';


abstract class Service {
  Dio dio = Dio();
  late Response response;
}

abstract class CatService extends Service {
  String baseurl = "https://freetestapi.com/api/v1/cats";
  Future<ResultModel> getCat();
  Future<ResultModel> getAllCat();
}

class CatServiceImp extends CatService {
  Future<ResultModel> getCat() async {
    try {
      response = await dio.get(baseurl + '/1');
      if (response.statusCode == 200) {
        CatModel cat = CatModel.fromMap(response.data);
        return cat;
      } else {
        return ErrorModel(message: 'The Status code is not 200');
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.error.toString());
    }
  }

  Future<ResultModel> getAllCat() async {
    try {
      response = await dio.get(baseurl);
      if (response.statusCode == 200) {
        List<CatModel> cats = List.generate(
          response.data.length,
          (index) => CatModel.fromMap(response.data[index]),
        );
        return ListOf<CatModel>(data: cats);
      } else {
        return ErrorModel(message: 'The Status code is not 200');
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.error.toString());
    }
  }
}




// class CatServiceBadSolution extends Service {
//   Future<TheResult> getCat() async {
//     try {
//       response = await dio.get(baseurl);
//       if (response.statusCode == 200) {
//         CatModel cat = CatModel.fromMap(response.data);
//         return TheResult<CatModel>(message: '', cat: cat);
//       } else {
//         return TheResult(message: 'The Status Code is Not 200', cat:null );
//       }
//     }on DioException catch (e) {
//       return TheResult(message: e.error.toString(), cat: null);
//     }
//   }
// }