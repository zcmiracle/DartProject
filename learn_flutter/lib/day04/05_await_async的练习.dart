import 'dart:io';

main(List<String> args) {
  
  print("main start");

  /// 业务代码用then 也可以用await async
  getData().then((res){
    print(res);
  }).catchError((error){
    print(error);
  });

  print("main end");
}


void getData() async {
  // // 1、调用第一次网络请求
  // getNetworkData("argument1").then((res){
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res){
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res){
  //   print(res);
  // });

  var res = await getNetworkData("argument1");  
  print(res);
  var res1 = await getNetworkData(res);
  print(res1);
  var res2 = await getNetworkData(res1);
  print(res2);

}

Future getNetworkData(String arg) {   
  return Future((){
    sleep(Duration(seconds: 3));
    return "hello world" + arg;
  });
}