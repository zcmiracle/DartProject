main(List<String> args) {
  
// ??=
// 当原来的变量有值时，那么 ??= 不执行
// 原来的变量为null，那么将值赋值给这个变量
var username = null;
username ??= "Miracle";
print(username);

// 此处 ??= 不会执行，因为name1 有值 
var name1 = "James";
name1 ??= "Tom";
print(name1);

var name = null;
var temp = name ?? "Fearless";
print(temp);



}