//数字、集合、字符串（https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more）
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

  //集合
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
}

void main(List<String> args) {
  dartCore();
}
