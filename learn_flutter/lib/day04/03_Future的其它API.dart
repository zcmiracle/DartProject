import 'dart:io';
import 'dart:io';

main(List<String> args) {
  Future((){
    sleep(Duration(seconds: 3));
  }).then((res) {
    print(res);
  });

  Future.value("hhh").then((res) {
    print(res);
  });

}