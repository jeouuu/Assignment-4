class Timer{
 
  int startT;
  int countT;
  
  Timer(){
    startT = millis();
    countT = 2000;
  }
  
  boolean countCheese(){
    //start counting the time and when it gets to 2 second, return true
    //then set the startT to current time
    if(millis()-startT >countT){
      startT = millis();
      return true;
    } else {
     return false; 
    }
  }
  
}
