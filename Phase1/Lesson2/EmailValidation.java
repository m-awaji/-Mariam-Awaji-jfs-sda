package com;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailValidation {
   private static final String regex ="^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}";  
   public static void main(String args[]) {
	   int ArraySize;
		Scanner input=new Scanner(System.in);
	 System.out.println("How many emails you want to enter?");
	 ArraySize=input.nextInt();
	 String[] emails=new String[ArraySize];
	 for(int counter=0;counter<ArraySize;counter++)
	 {
		 System.out.println("Enter the email "+(counter+1));
		 emails[counter]=input.next();
	 }
	 input.close();

       Pattern pattern = Pattern.compile(regex);
       for (String value : emails) {
           Matcher matcher = pattern.matcher(value);

           System.out.println("The Email address " +value+ " is " + (matcher.matches() ? "valid" : "invalid"));
       }
   }
}