import 'dart:io';

main(List<String> args) {
  print("main start");

  /// 发送一个网络请求
  var future = getNetworkData();
  print(future);

  /// 拿到结果
  /// then后面的回调函数声明时候被执行？？？
  /// 需要在Future函数有结果，才能执行下面的回调函数
  future.then((String value){
      print(value);
  }).catchError((error){
    print("执行catchError代码：$error");
  });

  print("main end");
}

/// 模拟一个网络请求
Future<String> getNetworkData() {
  return Future((){
    /// 1、将耗时的操作包裹到Future函数中
    /// 2、只要有返回结果，那么就执行Future对应的then的回调（Promise-resolve）
    /// 3、如果没有结果返回，或者有错误信息，需要在Future回调中抛出异常（Promise-reject）
    sleep(Duration(seconds: 5));
    // return "Hello World";

    throw Exception("错误信息");

  });
}