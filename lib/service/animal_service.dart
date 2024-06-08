import 'package:clean_service_layter/model/animal_model.dart';
import 'package:clean_service_layter/model/handling.dart';
import 'package:clean_service_layter/service/cat_service.dart';
import 'package:dio/dio.dart';

abstract class AnimalService extends Service {
  String baseurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/Animal";
  Future<ResultModel> createNewAnimal(AnimalModel animal);
}

class AnimalServiceImp extends AnimalService {
  @override
  Future<ResultModel> createNewAnimal(AnimalModel animal) async {
    try {
      response = await dio.post(baseurl, data: animal.toMap());
      if (response.statusCode == 201) {
        return SuccessModel(message: "Your Animal Has beed Created");
      } else {
        return ErrorModel(message: "The Value is Not Created");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message.toString());
    }
  }
}
