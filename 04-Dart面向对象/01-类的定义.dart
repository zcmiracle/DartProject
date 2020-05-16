main(List<String> args) {
  
  
  var p = Person("Fearless", 28);

  print(p.name);
  print(p.age);

}

class Person {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  Person(this.name, this.age);

}