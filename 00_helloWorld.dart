import 'dart:math';
//变量（https://dart.cn/samples#variables）
void variables() {
  var name = 'Voyager'; //dart支持类型推断，大多数变量不需要显示指定类型
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  for (final object in flybyObjects) {
    //循环输出
    print(object);
  }
  print(
      'name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is$image');
}

//流程控制语句（https://dart.cn/samples#control-flow-statements）
void control_flow(int year) {
  for (int month = 1; month <= 12; month++) print(month);
  if (year >= 2001)
    print('21 century');
  else if (year >= 1901) print('20 century');
}

//函数（https://dart.cn/samples#functions）
int fibonacci(int n) {
  if (n == 0 || n == 1)
    return n;
  else
    return fibonacci(n - 1) + fibonacci(n - 2);
}

//类（https://dart.cn/samples#classes）
class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
  Spacecraft(this.name, this.launchDate) {}
  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft:$name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched:$launchYear($years years ago)');
    } else {
      print('unlaunched');
    }
  }
}

void classfunc() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5)); //类
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('unlaunched |||');
  voyager3.describe();
}

void main() {
  print('Hello world!'); //你好世界
  variables(); //变量
  control_flow(1986); //流程控制
  print(fibonacci(8)); //函数
  classfunc(); //类
}
