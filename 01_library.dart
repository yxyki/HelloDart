

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

}

void main(List<String> args) {
  dartCore();

}
