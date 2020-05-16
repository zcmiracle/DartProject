main(List<String> args) {

  var person = Person();
  person.name = "Fearless";
  person.run();
  person.eat();

  // 级联运算符
  var p = Person()
          ..name = "Miracle"
          ..eat()
          ..run();

  print(p);

}

class Person {
  String name;

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }

}