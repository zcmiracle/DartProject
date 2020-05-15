main(List<String> args) {
  // 1、列表List []; 数组
  var names = ["123", "234", "345"];
  names.add("789");
  names.removeAt(0);

  // 2、集合Set
  var movies = {"星际穿越", "大话西游", "流浪地区"};
  // 迭代器 命名构造函数
  names = Set<String>.from(names).toList(); 
  print(names);

  // 3、映射Map 字典
  var info = {
    "name" : "Fearless",
    "age" : 18,
  };

  // print(names);
  print(movies);
  print(info);

  // Dart没有关键字来定义接口，默认情况下所有的class都是隐式接口
  // 抽象类用来继承比较多，接口用来做实现的

}