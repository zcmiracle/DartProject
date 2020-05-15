import 'dart:ffi';

import '03-函数特点.dart';

main(List<String> args) {
    // test((abc){
    //   print("abc");
    // });

  test((num1, num2){
    return num1 + num2;
  });

}

// 封装test函数，要求传入一个函数
// void test(Function foo) {
  // foo("Fearless");
// }

// void test(int foo(int num1, int num2)) {
//   foo(20, 30);
// } 

typedef Calculate = int Function(int num1, int num2);

void test(Calculate calc) {
  calc(20, 30);
}