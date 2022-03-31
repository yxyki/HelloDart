//变量（https://dart.cn/samples#variables）
void variables(){
  var name='Voyager';  //dart支持类型推断，大多数变量不需要显示指定类型
  var year=1977;
  var antennaDiameter=3.7;
  var flybyObjects=['Jupiter','Saturn','Uranus','Neptune'];
  var image={
    'tags':['saturn'],
    'url':'//path/to/saturn.jpg'
  };
  for (final object in flybyObjects) {
  print(object);
}
  print('name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is$image');
}

void outyear(var year){
  if(year>=2001)
  print('21st century');
  else if(year>=1901)
  print('20 century');
}

void main(List<String> args){
//变量
  for (int month = 1; month <= 12; month++) 
    print(month);
  variables();
  outyear(1999);
}