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
  print('name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is$image');
}

void main(List<String> args){
//变量
    variables();
}