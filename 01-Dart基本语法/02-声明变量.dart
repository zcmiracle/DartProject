main(List<String> args) {
  
  // 1、明确的声明  
  String name = "Fearless";

  // 2、类型推导 var final const
  // 类型推导的方式虽然没有明确的指定变量的类型，但是变量是有自己的明确的类型
  
  // 2.1 var声明变量
  var name1 = "Fearless";
  var age = 28;
  age = 30;

  // 2.2 final 声明常量
  final address = "深圳市";
  // address = "北京市"; 错误的，因为final只能声明常量

  // 2.3 const 声明常量
  const address1 = "上海市";
  // address1 = "长沙市"; 
  
  // 2.4 final 和 const 的区别？
  // const 必须赋值常量值 (编译期间需要有一个确定的值)
  // final 可以通过计算/函数获取一个值(运行期间来确定一个值)
  // const date1 = DateTime.now();  写法错误
  final date2 = DateTime.now();
  
  final person1 = Person("Fearless");
  final person2 = Person("Miracle");

  // 判断2个对象是否相等
  print(identical(person1, person2));

}


class Person {
  String name;

  Person(String name) {
    this.name = name;
  }
}