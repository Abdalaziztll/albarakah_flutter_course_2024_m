// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String name;
  String jop;
  String birthdate;
  Person._({
    required this.name,
    required this.jop,
    required this.birthdate,
  });

 static Person _person = Person._(name: 'Abd', jop: 'IT', birthdate: '1997');

 static getInstance() {
    return _person;
  }

  @override
  bool operator ==(covariant Person other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.jop == jop &&
        other.birthdate == birthdate;
  }

  @override
  int get hashCode => name.hashCode ^ jop.hashCode ^ birthdate.hashCode;
}
