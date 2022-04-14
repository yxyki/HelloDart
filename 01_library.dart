//数字、集合、字符串（https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more）
void dartCore(){
  print('#' * 40);
  print('数字，集合，字符串等库');

  assert(int.parse('42')==42);
  assert(int.parse('0x42')==66);
  assert(double.parse('0.50')==0.5)
}


void main(List<String> args){
  dartCore();
}