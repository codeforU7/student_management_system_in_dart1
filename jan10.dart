//synchronous(sequential->wastage of time(idle for sometime)) vs asynchronous(parallel)


//in synchronous future is waiting for one data until receved it
// use async before function
//parallel threading or parallel processing,there is no idle time for cpu

//async-->multitasking 
//async/stream/parallel=>async * keyworrd

//multitasking 


void main() async{
  bool iWantCoffee=true;
  if(iWantCoffee){
    await getCoffee();

  }
}


Future getCoffee() async{
  print("Order the Coffee");

  print("processing the coffee");

  //team master processing particular order
  await Future.delayed(Duration(seconds:5));
    

  
    //Future.delayed

  print("Coffee delivered");

}


