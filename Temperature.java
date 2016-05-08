package Learning;

import java.util.Scanner;

public class Temperature {
	public static void main(String[] args){
		System.out.println("Give Temperature in Celcius");;
		Scanner sc = new Scanner(System.in);
		double celsius = sc.nextDouble();
		double fahrenheit = ((9.0 / 5.0) *celsius) + 32.0;
		System.out.println("Fahrenheit" +fahrenheit);
	}

}
