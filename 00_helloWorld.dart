import 'dart:math';

//变量（https://dart.cn/samples#variables）
void variables() {
  print('#' * 40);
  print('变量');
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
  print('#' * 40);
  print('流程控制');
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

void funcr() {
  print('#' * 40);
  print('函数');
  var res = fibonacci(8);
  print('n为8的斐波那契数列结果为 $res');

  var flybyObjects = [
    'hellow',
    'abcde',
    '789',
    'how do you do',
    'nice to meet you',
    'you are lazy'
  ];
  //用胖剪头包含仅有一条语句的函数
  flybyObjects.where((name) => name.contains('you')).forEach(print);
}

//导入（https://dart.cn/samples#imports）
void imports() {
  print('#' * 40);
  print('导入');

  var mypi = pi;
  var t = sin(pi / 4);
  print('mypi的值为 $mypi');
  print('45度角的正弦值为 $t');
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
  print('#' * 40);
  print('类');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5)); //类
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('unlaunched |||');
  voyager3.describe();
}

//扩展类（https://dart.cn/samples#inheritance）
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

void extclass() {
  print('#' * 40);
  print('扩展类');

  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();
}

//Mixins(https://dart.cn/samples#mixins)
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts:$astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixinsf() {
  print('#' * 40);
  print('Mixins');

  var pilt = PilotedCraft('神舟一号', DateTime(1999, 11, 20));
  pilt.describe();
  pilt.describeCrew();
}

//接口和抽象类（https://dart.cn/samples#interfaces-and-abstract-classes）
class MockSpaceShip implements Spacecraft {
  @override
  DateTime? launchDate;
  String name;
  MockSpaceShip(this.name, this.launchDate);

  void describe() {
    print('Mock Spacecraft:$name');
  }

  int? get launchYear => launchDate?.year;
}

void interfacefunc() {
  print('#' * 40);
  print('接口和抽象类');

  var mock = MockSpaceShip('测试飞行器', null);
  mock.describe();
}

void main() {
  print('Hello world!'); //你好世界
  variables(); //变量
  control_flow(1986); //流程控制
  funcr(); //函数
  imports(); //导入
  classfunc(); //类
  extclass(); //扩展类
  mixinsf(); //Mixins
  interfacefunc(); //接口和抽象类
}
