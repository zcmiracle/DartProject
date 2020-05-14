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

}