main(List<String> args) {
  
  var p = Person("Fearless");
  // **** 命名可选参数一定要写名字 age: xxx name: xxxx  比如container容器
  // 命名可选参数 {this.age = 10} 要有age
  var student = Student("Fearless", age: 30);
  print(student.age);
  print(student.name);
}

class Person {
  // String name;
  // int age;

  final String name;
  final int age;


  // Person(this.name) {
  //   this.age = 20; // 赋值操作在这里不行
  // };  
 /**
  * 
  {
    执行这个{}的时候，代表已经初始化完毕了  
  }
  */

  // C++初始化列表
  // 类的初始化列表

  // this.age = age ?? 10  当前的成员变量由final进行修饰，意味着age只能赋值一次
  // 如果创建对象时，有传入一个age，那么使用传入的age，如果没有传入age，那么使用默认值 
  Person(this.name, {int age}) : this.age = age ?? 10 {

  }

}


class Student {
  final String name;
  final int age;

  // 这里做初始化，只能赋值过去一个确定的值，只能做赋值操作
  Student(this.name, {this.age = 10});
}