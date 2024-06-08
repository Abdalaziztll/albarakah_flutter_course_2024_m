// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResultModel {}

class ErrorModel extends ResultModel {
  String message;
  ErrorModel({
    required this.message,
  });
}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class ListOf<T extends ResultModel> extends ResultModel {
  List<T> data;
  ListOf({
    required this.data,
  });
}

class SuccessModel extends ResultModel {
  String message;
  SuccessModel({
    required this.message,
  });
}
