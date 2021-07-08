package com;
public class ArithmeticOperations {
	    int add(int num1, int num2)
	    {
	        return num1+num2;
	    }
	    int sub(int num1, int num2)
	    {
	        return num1-num2;
	    }
	    int mult(int num1, int num2)
	    {
	        return num1*num2;
	    }
	    int dev(int num1, int num2)
	    {
	        return num1/num2;
	    }
	    public static void main (String args[]) {
	    	  ArithmeticOperations obj = new ArithmeticOperations();
		        System.out.println("Addition of two numbers: "+obj.add(10,20));
		        System.out.println("Subtraction of two numbers: "+obj.sub(10,30));
		        System.out.println("Multiplication of two numbers: "+obj.mult(4,3));
	        try{
	        	 System.out.println("Division of two numbers: "+obj.dev(20,0));
	        } 
	        catch (ArithmeticException e) {
	           System.out.println ("Can't be divided by Zero " + e);
	        }
	     }
	  }