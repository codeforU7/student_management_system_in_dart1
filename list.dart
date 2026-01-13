void main(){
  List<(String,int,bool)>students=[

    ("omkar",24,true),
    ("rishu",30,true),
    ("ravi",32,false),
  ];

  for(var student in students){
    print("name :${student.$1}");

    print("age:${student.$2}");

    print("passed:${student.$3}");
  }

}