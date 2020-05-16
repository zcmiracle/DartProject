main(List<String> args) {
  
  // 1、创建Person对象
  var p = Person.withNameAgeHeight("Fearless", 28, 1.80);

  // 2、Object和dynamic的区别？
  // 父类应用指向子类对象
  // Object和dynamic
  // Object调用方法时，编译时会报错
  // dynamic调用方法时，编译时不会报错，但是运行时会存在安全隐患

  // Object obj = "Fearless";
  // print(obj.substring(1));

  // 明确声明 就是一种dynamic类型，不是类型推导var
  // dynamic obj1 = 123;
  // print(obj1.substring(1)); // NoSuchMethodError: Class 'int' has no instance method 'substring'.

  var p1 = Person.fromMap({
    "name" : "Miracle",
    "age" : 18,
    "height" : 1.70
  });
  print(p1);

}


class Person {
  String name;
  int age;
  double height;

  Person(this.name, this.age);
  // Person(this.name, this.age, this.height); 不能这样写，因为Dart没有函数重载
  // Person(this.name, this.age, {this.height}); 

  // 命名构造函数 Dart没有函数重载
  // {this.height} 是可选参数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  // dynamic 动态类型(任意类型)
  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    // TODO: implement toString
    // 重写toString方法
    return "$name $age $height";
  }


}