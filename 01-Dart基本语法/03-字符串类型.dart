main(List<String> args) {
  
  // 1、定义字符串
  var str1 = 'miracle';
  var str2 = "ZCMiracle";
  var str3 = """
  123
  456
  789
  """;

  // 2.字符串和表达式进行拼接
  var name = "Fearless";
  var age = 28;
  var height = 170;


  // 如果 ${变量}  那么{}可以省略
  // var message1 = "my name is ${name}, age is ${age}, height is ${height}";
  // var message2 = "name is ${name}, type is ${name.runtimeType}";
  var message1 = "my name is $name, age is $age, height is $height";
  var message2 = "name is $name, type is ${name.runtimeType}";

  print(message1);
  print(message2);
}