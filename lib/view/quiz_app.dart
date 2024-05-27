// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getQuiz(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Scaffold(
                  body: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data![index].question),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data![index].answer.length,
                          itemBuilder: (context, ind) {
                            return ListTile(
                              title: Text(snapshot.data![index].answer[ind]),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<List<QuizModel>> getQuiz() async {
  Dio req = Dio();
  Response response =
      await req.get("https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/quiz");
  print(response);
  List<QuizModel> quiz = List.generate(
    response.data.length,
    (index) => QuizModel.fromMap(response.data[index]),
  );
  print(quiz);
  return quiz;
}

class QuizModel {
  String question;
  List<String> answer;
  num indexOfCorrect;
  QuizModel({
    required this.question,
    required this.answer,
    required this.indexOfCorrect,
  });

  QuizModel copyWith({
    String? question,
    List<String>? answer,
    num? indexOfCorrect,
  }) {
    return QuizModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      indexOfCorrect: indexOfCorrect ?? this.indexOfCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'indexOfCorrect': indexOfCorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      answer:List.generate(map['answer'].length,(index) => map['answer'][index],),
      indexOfCorrect: map['indexOfCorrect'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuizModel(question: $question, answer: $answer, indexOfCorrect: $indexOfCorrect)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.answer, answer) &&
        other.indexOfCorrect == indexOfCorrect;
  }

  @override
  int get hashCode =>
      question.hashCode ^ answer.hashCode ^ indexOfCorrect.hashCode;
}
