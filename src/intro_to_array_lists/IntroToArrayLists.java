package intro_to_array_lists;

import java.util.ArrayList;
import java.util.Iterator;

public class IntroToArrayLists {
	public static void main(String[] args) {
		//1. Create an array list of Strings
		//   Don't forget to import the ArrayList class
		
		ArrayList<String> a = new ArrayList<String>();
		
		//2. Add five Strings to your list
		
		a.add("cake");
		a.add("ice cream");
		a.add("cookies");
		a.add("chips");
		a.add("popcorn");
		
		
		//3. Print all the Strings using a standard for-loop
		
		for (int i = 0; i < a.size(); i++) {
			
		
			
			
			
			System.out.println(a.get(i));
			
		}
		
		
		//4. Print all the Strings using a for-each loop
		
		for(String all : a)		{
			
			System.out.println(all);
			
		}
			
		
		
		
		//5. Print only the even numbered elements in the list.
	
		for (int i = 0; i < a.size(); i++) {
			
			if(i%2==0) {
				System.out.println(a.get(i));
			}
		
			
		}
	
		
		//6. Print all the Strings in reverse order.
		
		for (int i = a.size()-1; i >= 0; i--) {
			
			System.out.println(a.get(i));
			
		}
		
		
		//7. Print only the Strings that have the letter 'e' in them.
		
		for (int i = 0; i < a.size(); i++) {
			
			if(a.contains("e")) {
				
				System.out.println(a.get(i));
				
			}
			
		}
		
	}
	
}

