package Learning;


import java.util.HashMap;

public class Library{
 
  public Library(){
    
  }
  
  public void getFinishedBooks(HashMap<String, Boolean> myBooks){
    if(myBooks.size() < 1){
      System.out.println("There are no finished books");
    }
    else {
     for (String book : myBooks.keySet() ) {
       if (myBooks.get(book)) {
      System.out.println (book +"is finished"); 
       }
     }
    }
  }
  
  public static void main(String[] args){
    
    HashMap<String, Boolean> myBooks = new HashMap<String, Boolean>();
    myBooks.put("Road Down The Funnel", true);
    myBooks.put("Rat: A Biology", false);
    myBooks.put("TimeIn", true);
    myBooks.put("3D Food Printing", false);
    
    Library mylibrary = new Library();
    mylibrary.getFinishedBooks(myBooks);
  }
  
}