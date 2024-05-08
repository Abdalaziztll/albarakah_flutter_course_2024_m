// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:async_await_and_list_map/async_await_and_list_map.dart';
import 'package:dio/dio.dart';

void main() async {
  // print("object");
  // Future<String> message = scanner();
  // print("New");

  // print(await message);

  // List<String> names = ["Ahmad", "Hamza", "Mostafa", "Noor"];

  // print(names.length);

  // Map<String, num> marks = {"Math": 30, "E": 90, "Algo": 89};
  // print(marks.keys.elementAt(2));

  // List<Map<String, dynamic>> nestedListwithMap = [
  //   {
  //     "Name": "Ahmad",
  //     "Age": 30,
  //     "Job": "Worker",
  //   },
  //   {
  //     "Name": "Yaser",
  //     "Age": 30,
  //     "Job": "Worker",
  //   },
  //   {
  //     "Name": "Ahmad",
  //     "Age": 90,
  //     "Job": "Worker",
  //   },
  // ];
  // nestedListwithMap.shuffle();
  // print(nestedListwithMap);
  // print(nestedListwithMap[2].values.elementAt(1));

  // nestedListwithMap.forEach((element) {
  //   print(element);
  // });

  // Map<String, List<Map<String, dynamic>>> nestedMap = {
  //   "Ahmad": [
  //     {"Algo": 90, "Math": 59, "E": 91},
  //   ],
  //   "Yaser": [
  //     {"Algo": 20, "Math": 100, "E": 60},
  //   ]
  // };
  // print(nestedMap["Ahmad"]![0].keys.elementAt(1));
  // print(nestedMap.keys.elementAt(1));
  // print(nestedMap["Yaser"]![0].values.elementAt(2));

  // ? Restapi request with GET method

  var data = await getTodos();
  List<Todos> todos = [];
// ? first try to serilize a List of Map
  for (var i = 0; i < data.length; i++) {
    Todos todo = Todos.fromMap(data[i]);
    todos.add(todo);
  }

  print(todos);

  // ! second try to selizie a List Of Map
  List<Todos> names = List.generate(
    data.length,
    (index) => Todos.fromMap(
      data[index],
    ),
  );
  print(names);

  var userMap = await getUser();

  User user1 = User.fromMap(userMap);

  print(user1.address);
}

Future<String> scanner() async {
  await Future.delayed(Duration(seconds: 1));

  return "Hello";
}

Future<dynamic> getTodos() async {
  Dio req = Dio();

  Response result = await req.get("https://jsonplaceholder.typicode.com/todos");

  if (result.statusCode == 200) {
    return result.data;
  } else {
    return "No INternet";
  }
}

Future<dynamic> getUser() async {
  Dio req = Dio();

  Response result =
      await req.get("https://jsonplaceholder.typicode.com/users/1");

  return result.data;
}
