package Learning;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Mariner4 {
	
	public static void main (String[] args){
		char myValue = 'B';
		
		switch(myValue)
		{
		case 'B' : {System.out.println("Hi Dear");
		           System.out.println("You may ");
		           break;
		}		case 'A' : System.out.println("Hello Sweetheart");
					break;
		default : System.out.println("Heheeee");
		             break;
		}
		Day launchDate = new Day();
		
		System.out.println(days(228,));
		
	}

	public Date days (int days, Date launchDate){
		DateFormat dateFormat= new SimpleDateFormat("dd/MM/yyyy");
		Calendar calDate = Calendar.getInstance();
		calDate.setTime(launchDate);
		calDate.add(Calendar.DATE, days);
		Date newDate = calDate.getTime();
		System.out.println(dateFormat.format(calDate.getTime()));
		return newDate;
	}
	
}

