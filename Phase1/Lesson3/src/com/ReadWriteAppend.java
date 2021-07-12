package com;

	import java.io.FileReader;
	import java.io.FileWriter;

	public class ReadWriteAppend {
	public static void main(String[] args)
	{
     String text_write="Original text";
     String Text_append="New text";

		try
		{
			FileWriter writer=new FileWriter("myfile.txt");
			writer.write(text_write);
			FileReader reader=new FileReader("myfile.txt");
			int x=0;
			while((x=reader.read()) !=-1) {
				writer.write(x);
				writer.flush();	
			}
			writer.close();
			reader.close();
			System.out.println("Successfull read and write to the file!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try {
			FileWriter writer=new FileWriter("myfile.txt");
			writer.write(Text_append);
			writer.flush();	
			writer.close();
			System.out.println("Successfull append to the file!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	}
