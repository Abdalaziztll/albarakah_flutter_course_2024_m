void main() {
  int counter = 20;
  String name = "Ahmad";
  var mark = 20;

  print(name);
  print(counter);
  mark = 30;
  print(mark);

  bool? is_Logged_in;
  print(is_Logged_in);

  const degree = 30;
  // degree = 20;

  final temperture;
  temperture = 70;
  print(temperture);

  dynamic allType = "Hello wolrd";
  print(allType.runtimeType);
  allType = 20;
  print(allType.runtimeType);
  dynamic temp;
  print(temp.runtimeType);

  
}
