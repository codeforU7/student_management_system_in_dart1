void main(){
  //print('Hello, World!');

  //Homework-1

  /*String zone="ABC";
   int weight=30;

   int cost=zone=="ABC"?weight*5:zone=="DEF"?weight*7:zone=="GHI"?weight*10:0;
   print("cost is :$cost");*/




   //Homework -2:


   (String grade,String remark, bool isEligible) evaluateStudents(String name,int marks,double attendance){
    String grade;
    String remark;
    bool Eligible;
    

    if(marks>=90){
      grade="S";
      remark="excellent";

    }
    else if(marks>=80){
      grade="A";
      remark="very good";

    }
    else if(marks>=70){
      grade="B";
      remark="good";
    }
    else if(marks>=65){
      grade="C";
      remark=" pass";
    }
    else
      grade="D";
      remark="improvent needed";
    }

    Eligible=marks>=40 && attendance >=75.0;



    return (grade,remark,Eligible);




    


   
   
}


void main(){
  var result=evaluateStudents("omkar",78,82.5);
  print("grade: {result.$1}");

}



 








