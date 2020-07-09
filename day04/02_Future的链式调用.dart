import 'dart:io';

main(List<String> args) {
  print("main start");

  Future((){
    /// 1、发送第一次请求
    sleep(Duration(seconds: 3));
    return "第一次的结果";
  }).then((res) {
    print(res);
    /// 2、发送第二次请求
    sleep(Duration(seconds: 2));
    // return "第二次的结果";
    throw Exception("第二次异常");
  }).then((res) {
    print(res);
    /// 3、发送第三次请求
    sleep(Duration(seconds: 2));
    return "第三次结果";
  }).then((res) {
    print(res);
  }).catchError((error) {
    print(error);
  });

  print("main end");
}