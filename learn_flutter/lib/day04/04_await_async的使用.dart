import 'dart:io';

main(List<String> args) {
  print("main start");

  var result = getNetworkData().then((res){
    print(res);
  });

  print("main end");
}

/**
 * 1、await必须在async函数中才能用 
 * 2、async返回的结果必须是一个Future
 * 直接返回结果，系统会自动对我们结果进行包裹
 */
Future getNetworkData() async {   
  await sleep(Duration(seconds: 3));
  return "Future Hello World";
}
