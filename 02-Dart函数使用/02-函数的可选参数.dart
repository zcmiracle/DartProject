main(List<String> args) {
  sayHello1("Fearless");
  sayHello2("Fearless", 18);
  // 命名可选参数位置可换
  sayHello3("Fearless", age: 18, height: 170);
  sayHello3("Fearless", height: 170, age: 18);
}

// 必选参数：必须传 不然报错
void sayHello1(String name) {
  print(name);
}

// Dart没有函数重载
// 可选参数：位置可选参数 + 命名可选参数
// 注意：只有可选参数才可以有默认值，必选参数是不能设置默认值，因为必选参数一定要传值
// 位置可选参数：[int age, double height]
// 实参 和 形参 进行匹配时，是根据位置的匹配

// 位置可选参数 可以有默认值
void sayHello2(String name, [int age = 10, double height = 175]) {

}

// 命名可选参数 可以有默认值
void sayHello3(String name, {int age = 10, double height = 175}) {

}