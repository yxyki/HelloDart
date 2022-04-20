//数字、集合、字符串（https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more）
//import 'dart:math';

void dartCore() {
  print('#' * 40);
  print('数字，集合，字符串等库');

  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(int.parse('42', radix: 16) == 66);
  //Convert an int to a Strinng
  assert(42.toString() == '42');
  //Convert a double to a String
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46'); //保存到小数点后几位
  assert(123.456.toStringAsPrecision(3) == '123'); //科学计数法
  assert(double.parse('1.2e+2') == 120.0);

  var str = 'Never odd or even';
  assert(str.contains('odd')); //一个字符串是否包含另一个字符串
  assert(str.startsWith('Never')); //检查一个字符串是否以某个字符串开始
  assert(str.endsWith('even')); //检查一个字符串是否以某个字符串结束
  assert(str.indexOf('or') == 10); //检查or在字符串中的开始位置

  //从字符串中体术数据
  assert(str.substring(6, 9) == 'odd');

  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[1] == 'web');
  assert(str[0] == 'N'); //Get a UT-16 code unit(as a string) by index

  for (final char in 'Hello'.split('')) print(char);

  var codeUnitList =
      str.codeUnits.toList(); //Get all the UTF-16 code units in the string
  assert(codeUnitList[0] == 78);

  //首字母大小写转化
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  assert('  hello   '.trim() == 'hello'); //使用trim()去除空格
  assert(''.isEmpty); //使用isEmpty判断字符串是否为空
  assert('  '.isNotEmpty); //使用isNotEmpty判断字符串是否不为空

  //替换部分字符串
  var greetingTemplate = 'Hello,NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);

  //构建一个字符串
  var sb = StringBuffer();
  sb
    ..write('Use a stringbuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  var fullstring = sb.toString();
  assert(fullstring == 'Use a stringbuffer for efficient string creation.');

  //正则表达式
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDights = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers));
  assert(someDights.contains(numbers));
  var exedOut = someDights.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  assert(numbers
      .hasMatch(someDights)); //Check whether the reg has a match in a string
  for (final match in numbers.allMatches(someDights)) print(match.group(0));
}

//集合（https://dart.cn/guides/libraries/library-tour#collections）
void Collections() {
  print('#' * 40);
  print('集合');

  ListFunc();
  SetsFunc();
  MapFunc();
}

void ListFunc() {
  //List
  var grains = <String>[]; //Create an empty List
  assert(grains.isEmpty);
  var fruits = ['apples', 'oranges']; //Create a list using a literal
  fruits.add('kivis'); //add one
  fruits.addAll(['balanas', 'grapes']); //add several
  assert(fruits.length == 5);
  var appleIndex = fruits.indexOf('apples'); //删除指定位置的元素
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  fruits.clear(); //移除所有元素
  assert(fruits.isEmpty);
  var vegetables = List.filled(99, 'eggplants'); //使用一种结构构造List
  assert(vegetables.every((v) => v == 'eggplants'));

  var fruit = ['apples', 'bananas']; //使用indexof()函数查找一个元素的下标值
  assert(fruit.indexOf('apples') == 0);
  assert(fruit[0] == 'apples');
  fruits = ['apples', 'bananas', 'grapes'];
  fruits.sort((a, b) => a.compareTo(b)); //使用sort函数为List元素排序
  assert(fruits.indexOf('apples') == 0);
  var fruits2 = <String>[]; //指定List包含元素的类型
  fruits2.add('apples');
  var Fruit = fruits2[0];
  assert(Fruit == 'apples');
}

void SetsFunc() {
  //Sets
  var ingredients = <String>{};
  ingredients.addAll(['gold', 'titanium', 'xenon']); //添加元素
  assert(ingredients.length == 3);
  ingredients.add('gold'); //添加重复元素无效
  assert(ingredients.length == 3);
  ingredients.remove('gold');
  assert(ingredients.length == 2); //删除元素
  var atomicNumbers = Set.from(['79', '88', '60']);
  assert(atomicNumbers.length == 3);

  ingredients.add('gold'); //使用contains和containsAll判断是否包含元素
  assert(ingredients.contains('xenon'));
  assert(ingredients.containsAll(['gold', 'xenon']));

  var nobelGases = Set.from(['xenon', 'argon']); //求两个集合的交集
  var intersection = ingredients.intersection(nobelGases);
  assert(intersection.contains('xenon'));
}

void MapFunc() {
  //Maps
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailuo', 'Waimanalo'],
    'Big Island': ['Wailed Boy', 'Palolu Beach'],
    'Kauai': ['Hanale', 'Poipu']
  };
  //var searchTerms = Map(); //Map can be built from a consrtuctor
  var nobleGases = Map<int, String>();
  //Maps are parameterized types; you can specify what
  // types the key and value should be.

  nobleGases = {54: 'xenon'};
  //Retrieve a value with a key
  assert(nobleGases[54] == 'xenon');
  //Check whether a map contains a key
  assert(nobleGases.containsKey(54));
  //Remove a key and its value
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //从一个map中检索所有的key或所有的value
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  //使用containskey检查Map是否包含某个key
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florido'));
  //当key不再map，且要为这个key赋值，可用putIfAbsent函数
  String pickToughestKid() {
    return "pickToughestKid";
  }
  var teamAssinment = <String, String>{};
  teamAssinment.putIfAbsent('Catche',()=> pickToughestKid());
}

void main(List<String> args) {
  dartCore();
  Collections();
}
