package com;
	
	import java.io.File;
	import java.io.IOException;
	import java.nio.file.Files;
	import java.nio.file.Path;
	import java.nio.file.Paths;
	import java.util.ArrayList;
	import java.util.Arrays;
	import java.util.Collections;
	import java.util.List;
	import java.util.Scanner;
	import java.util.stream.Collectors;
	import java.util.stream.IntStream;

	public class LockedMe {

			public static void main(String[] args) {
							
				System.out.println("Welcome to LockedMe.com\n\n"
						+ "This application was developed by Mariam Awaji \n");
				System.out.println("The application will enable you to :\n"
						+ "1) Retrieve all file names in the \"Source\" folder.\n"
						+ "2) Search, add, or delete files in \"Source\" folder."
						+ " \nNote: When searching or deleting files, please make sure that you type the correct filename.");
			WelcomeScreen();
			CreateSourceFolder("Source");
			}

		public static void DisplayMainMenu() {
				String menu = "\n\nEnter (1, 2 or 3) to do one of the following and press Enter:\n\n"
						+ "1 -> Retrieve all files inside \"Source\" folder\n" 
						+ "2 -> Display menu for File operations\n"
						+ "3 -> Exit application\n";
				System.out.println(menu);

			} 
		public static void DisplayFileMenuOptions() {
			String fileMenuOptions = "\n\nEnter (1, 2, 3, 4 or 5) to perform one of "
					+ "the following file operations and press Enter\n\n"
					+ "1) Add a file to \"Source\" folder\n" 
					+ "2) Delete a file from \"Source\" folder\n"
					+ "3) Search for a file from \"Source\" folder\n" 
					+ "4) Show Previous Menu\n" 
					+ "5) Exit application\n";

			System.out.println(fileMenuOptions);
		}
			public static void WelcomeScreen() {
				boolean running = true;
				Scanner sc = new Scanner(System.in);
				
				do {
					try {
						DisplayMainMenu();
						int input = sc.nextInt();

						switch (input) {
						case 1:
							displayAllFiles("Source");
							break;
						case 2:
							handleFileMenuOptions();
							break;
						case 3:
							System.out.println("Application terminated  successfully.");
							running = false;
							sc.close();
							System.exit(0);
							break;
						default:
							System.out.println("Please select a valid option from above options.");
						}
					} catch (Exception e) {
						System.out.println(e.getClass().getName());
						WelcomeScreen();
					} 
				} while (running == true);
			}
			
			
			
			public static void handleFileMenuOptions() {
				boolean running = true;
				Scanner sc = new Scanner(System.in);
				do {
					try {
						DisplayFileMenuOptions();
						CreateSourceFolder("Source");
						
						int input = sc.nextInt();
						switch (input) {
						case 1:
							System.out.println("Enter the name of the file to be added to the \"Source\" folder");
							String fileToAdd = sc.next();
							
							createFile(fileToAdd, sc);
							
							break;
						case 2:
							System.out.println("Enter the name of the file to be deleted from \"Source\" folder");
							String fileToDelete = sc.next();
							CreateSourceFolder("Source");
							List<String> filesToDelete = displayFileLocations(fileToDelete, "Source");
					
							{String deletionPrompt = "\n(Enter 0 to confirm deletion or to exit to the prevoius menu)";
							System.out.println(deletionPrompt);
							int i = sc.nextInt();
							if (i != 0) {
								DeleteFiles(filesToDelete.get(i - 1));
							} else {
								for (String path : filesToDelete) {
									DeleteFiles(path);
								}
							}
							}

							break;
						case 3:
							System.out.println("Enter the name of the file to be searched from \"Source\" folder");
							String fileName = sc.next();
							
							CreateSourceFolder("Source");
							displayFileLocations(fileName, "Source");

							
							break;
						case 4:
							return;
						case 5:
							
							System.out.println("Application terminated  successfully.");
							running = false;
							sc.close();
							
							System.exit(0);
						default:
							System.out.println("Please select a valid option from above options.");
						}
					} catch (Exception e) {
						System.out.println(e.getClass().getName());
						handleFileMenuOptions();
					}
				} while (running == true);
			}
			public static void CreateSourceFolder(String folderName) {
				File file = new File(folderName);

				if (!file.exists()) {
					file.mkdirs();
				}
			}

			public static void displayAllFiles(String path) {
				CreateSourceFolder("Source");
				
			    System.out.println("Displaying all files with directory structure in ascending order\n");

				List<String> filesListNames = listFilesInDirectory(path,0, new ArrayList<String>());
				
				System.out.println("Displaying all files in ascending order\n");
				Collections.sort(filesListNames);

				filesListNames.stream().forEach(System.out::println);
			}

			public static List<String> listFilesInDirectory(String path, int indentationCount, List<String> fileListNames) {
				File dir = new File(path);
				File[] files = dir.listFiles();
				List<File> filesList = Arrays.asList(files);

				Collections.sort(filesList);

				if (files != null && files.length > 0) {
					for (File file : filesList) {

						System.out.print(" ".repeat(indentationCount * 2));

						if (file.isDirectory()) {
							System.out.println(file.getName());

							fileListNames.add(file.getName());
							listFilesInDirectory(file.getAbsolutePath(), indentationCount + 1, fileListNames);
						} else {
							System.out.println(file.getName());
							fileListNames.add(file.getName());
						}
					}
				}  else {
					System.out.print(" ".repeat(indentationCount * 2));
					System.out.println("Empty Directory");
				} 
				System.out.println();
				return fileListNames;
			} 

			public static void createFile(String fileToAdd, Scanner sc) {
				CreateSourceFolder("Source");
				Path pathToFile = Paths.get("./Source/" + fileToAdd);
				try {
					Files.createDirectories(pathToFile.getParent());
					Files.createFile(pathToFile);
					System.out.println("\n"+fileToAdd + " created successfully");

				} catch (IOException e) {
					System.out.println("\nFailed to create file " + fileToAdd+". File already exists.\n");
				}
			}
			

			public static List<String> displayFileLocations(String fileName, String path) {
				List<String> fileListNames = new ArrayList<>();
				searchFileRecursively(path, fileName, fileListNames);

				if (fileListNames.isEmpty()) {
					System.out.println("\n\nCouldn't find any file with given file name \"" + fileName + "\" \n\n");
				} else {
					System.out.println("\n\nFound file at below location(s):");

					List<String> files = IntStream.range(0, fileListNames.size())
							.mapToObj(index -> (index + 1) + ": " + fileListNames.get(index)).collect(Collectors.toList());

					files.forEach(System.out::println);
				}

				return fileListNames;
			}

			public static void searchFileRecursively(String path, String fileName, List<String> fileListNames) {
				File dir = new File(path);
				File[] files = dir.listFiles();
				List<File> filesList = Arrays.asList(files);

				if (files != null && files.length > 0) {
					for (File file : filesList) {

						if (file.getName().startsWith(fileName)) {
							fileListNames.add(file.getAbsolutePath());
						}

						if (file.isDirectory()) {
							searchFileRecursively(file.getAbsolutePath(), fileName, fileListNames);
						}
					}
				}
			}

			public static void DeleteFiles(String path) {

				File currFile = new File(path);
				File[] files = currFile.listFiles();

				if (files != null && files.length > 0) {
					for (File file : files) {

						String fileName = file.getName() + " at " + file.getParent();
						if (file.isDirectory()) {
							DeleteFiles(file.getAbsolutePath());
						}

						if (file.delete()) {
							System.out.println("\n"+fileName + " deleted successfully");
						} else {
							System.out.println("\n"+"Failed to delete " + fileName);
						}
					}
				}

				String currFileName = currFile.getName() + " at " + currFile.getParent();
				if (currFile.delete()) {
					System.out.println("\n"+currFileName + " deleted successfully");
				} else {
					System.out.println("\n"+"Failed to delete " + currFileName);
				}
		
			
		}



}
