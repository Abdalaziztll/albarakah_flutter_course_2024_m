import 'package:flutter/material.dart';
import 'package:snack_bar_model_with_ui_list_builder/model/quiz_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogInPage());
  }
}

List<QuizModel> quiz = [
  QuizModel(
      question: 'How long are you ?',
      answers: ['20', '100', '180', '190'],
      indexOfCorrectAnswer: 2),
  QuizModel(
      question: 'How Old are you ?',
      answers: ['20', '10', '18', '19'],
      indexOfCorrectAnswer: 2),
  QuizModel(
      question: 'How are you ?',
      answers: ['Fine', '1', '0', 'Not Fine'],
      indexOfCorrectAnswer: 2),
];

PageController controller = PageController();

QuizModel quizModel = QuizModel(
    question: 'How long are you ?',
    answers: ['20', '100', '180', '190'],
    indexOfCorrectAnswer: 2);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            quizModel.question,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 500,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              // reverse: true,
              itemCount: quizModel.answers.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: GlobalKey(),
                  child: ListTile(
                    onTap: () {
                      if (index == quizModel.indexOfCorrectAnswer) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          showCloseIcon: true,
                          action:
                              SnackBarAction(label: 'Undo', onPressed: () {}),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          content: Text("Success"),
                          backgroundColor: Colors.green,
                        ));
                        controller.nextPage(
                            duration: Duration(seconds: 2),
                            curve: Curves.bounceOut);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          showCloseIcon: true,
                          // action: SnackBarAction(label: 'Undo', onPressed: () {}),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          content: Text("Loooooser"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(quizModel.answers[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Est excepteur laboris exercitation anim cillum ullamco cupidatat in.

class HomePageWithPageView extends StatelessWidget {
  const HomePageWithPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      itemCount: quiz.length,
      itemBuilder: (context, index) {
        return Scaffold(
          body: Column(
            children: [
              Text(
                quiz[index].question,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (context, ind) => Divider(),
                  // reverse: true,
                  itemCount: quiz[index].answers.length,
                  itemBuilder: (context, ind) {
                    return Dismissible(
                      key: GlobalKey(),
                      child: ListTile(
                        onTap: () {
                          if (ind == quiz[index].indexOfCorrectAnswer) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              showCloseIcon: true,
                              action: SnackBarAction(
                                  label: 'Undo', onPressed: () {}),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              content: Text("Success"),
                              backgroundColor: Colors.green,
                            ));
                            controller.nextPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.bounceOut);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              showCloseIcon: true,
                              // action: SnackBarAction(label: 'Undo', onPressed: () {}),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              content: Text("Loooooser"),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        leading: CircleAvatar(
                          child: Text((ind + 1).toString()),
                        ),
                        title: Text(quiz[index].answers[ind]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

TextEditingController email = TextEditingController();

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              
              // obscureText: true,
              controller: email,
              onChanged: (value) {},
              decoration: InputDecoration(
                prefix: Icon(Icons.email),
                // helperText: 'Username',
                // hintText: 'UserName',
                labelText: 'Email',
                // label: FlutterLogo(),
                fillColor: Colors.red,
                filled: false,

                border: OutlineInputBorder(),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (email.text == 'Hello') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  showCloseIcon: true,
                  action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  content: Text("Success"),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  showCloseIcon: true,
                  action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  content: Text("Not Auth"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            child: Container(
              width: 300,
              height: 50,
              child: Center(
                child: CircularProgressIndicator(
                  // backgroundColor: Colors.red,
                  value: 0.1,
                ),
                // child: LinearProgressIndicator(

                // ),
              ),
            ),
          ),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: (index == 0) ? Colors.brown : Colors.blue,
                          width: 75,
                          height: 75,
                          child: Center(
                            child: Text("Hello"),
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
