package com.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.model.CookingDAO;


public class csvReader {

	String natural_food = "C:\\Users\\vdi02\\Desktop\\Health_Project\\csv\\natural_food.csv";
	String processed_food = "C:\\Users\\vdi02\\Desktop\\Health_Project\\csv\\processed_food.csv";
	String korean_dish = "C:\\Users\\vdi02\\Desktop\\Health_Project\\csv\\korean_dish.csv";
	String encod = "euc-kr";
	ArrayList<String[]> result = null;
	BufferedReader br = null;
	
	public ArrayList<String[]> getRandomIMG(){

		ArrayList<String[]> arr = new ArrayList<>();

		String breakfast = "C:\\Users\\VDI02\\Desktop\\java\\web\\Health\\WebContent\\csv\\breakfast.csv";
		String lunch = "C:\\Users\\VDI02\\Desktop\\java\\web\\Health\\WebContent\\csv\\lunch.csv";
		String dinner = "C:\\Users\\VDI02\\Desktop\\java\\web\\Health\\WebContent\\csv\\dinner.csv";

		//String encoding = "EUC-KR";
		

		ArrayList<String[]> breakfastInfo = getCSVInfo(breakfast, encod, 3);

		// insertList(naturalFoodInfo);

		ArrayList<String[]> lunchInfo = getCSVInfo(lunch, encod, 3);

		// insertList(processedFoodInfo);

		ArrayList<String[]> dinnerInfo = getCSVInfo(dinner, encod, 3);

		// insertList(koreanDishInfo);

		arr.add(randomCSV(breakfastInfo));
		arr.add(randomCSV(lunchInfo));
		arr.add(randomCSV(dinnerInfo));

		return arr;

	}
	
	public String[] getRandomCelebrityIMG(){
		String celebrity = "C:\\Users\\VDI02\\Desktop\\java\\web\\Health\\WebContent\\csv\\celebrity_cooking.csv";
		ArrayList<String[]> cel = getCSVInfo(celebrity, encod, 3);
		String[] arr = randomCSV(cel);
		
		return arr;
	}

	public static String[] randomCSV(ArrayList<String[]> csv) {

		Random r = new Random();
		r.setSeed(System.currentTimeMillis());

		int a = r.nextInt(csv.size());

		String[] arr = csv.get(a);

		return arr;

	}


	public static void insertList(ArrayList<String[]> list) {
		for (int i = 0; i < list.size(); i++) {
			String temp[] = list.get(i);

			CookingDAO dao = new CookingDAO();

			int cnt = dao.insertCookingInfo(temp[1], temp[2], temp[3]);

			if (cnt > 0) {
				continue;
			} else {
				break;
			}
		}
	}

	public static void printArrayList(ArrayList<String[]> list) {

		for (int i = 0; i < list.size(); i++) {
			String temp[] = list.get(i);
			for (int j = 0; j < temp.length; j++) {
				System.out.print(temp[j]);
			}
			System.out.println();
		}

	}

	public static ArrayList<String[]> getCSVInfo(String path, String encoding, int col) {
		BufferedReader br = null;

		String line = "";
		int num = 0;

		ArrayList<String[]> result = new ArrayList<String[]>();

		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(path), encoding));

			while ((line = br.readLine()) != null) {
				num++;

				if (num == 1) {
					continue;
				}

				String[] temp = line.split(",");

				for (int i = 0; i < temp.length; i++) {
					temp[i] = temp[i].replaceAll("\"", "");
					temp[i] = temp[i].replaceAll("trace", "0");
				}

				String ind = null;
				String name = null;
				String calorie = null;
				String protein = null;

				ind = temp[0];

				try {
					if (temp.length > col) {
						StringBuffer tempName = new StringBuffer();

						for (int i = 1; i < temp.length - 2; i++) {
							tempName.append(temp[i]);
						}

						name = tempName.toString();

					} else {
						name = temp[1];
					}

					protein = temp[temp.length - 1];
					calorie = temp[temp.length - 2];
				}
				catch (Exception e) {

				}

				String food[] = {ind, name, calorie, protein};

				result.add(food);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();

		} catch (IOException e) {
			e.printStackTrace();

		} finally {

			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public void jsonConversion(HttpServletRequest request, HttpServletResponse response, ArrayList<String[]> list) throws ServletException, IOException {
		JsonObject jsonFin = new JsonObject();
		JsonArray jsonArr = new JsonArray();
		
		for (int i = 0; i < list.size(); i++) {
			String temp[] = list.get(i);
			JsonObject jsonObj = new JsonObject();
			
			try {
				jsonObj.addProperty("num", temp[0]);
				jsonObj.addProperty("name", temp[1]);
				jsonObj.addProperty("address", temp[2]);
				jsonObj.addProperty("pn", temp[3]);
				jsonObj.addProperty("road", temp[4]);
			}
			catch (Exception e) {
				
			}
			jsonArr.add(jsonObj);
		}
		jsonFin.add("place", jsonArr);
		HttpSession session = request.getSession();
		session.setAttribute("GwangJu", jsonFin);
		session.setAttribute("listLength", list.size());
	}

	public ArrayList<String[]> getCSV(String path, String encoding, int col) {
		
		String line = "";
        int num = 0;
        
        result = new ArrayList<String[]>();
        
        try {
        	br = new BufferedReader(new InputStreamReader(new FileInputStream(path), encoding));
            
            while ((line = br.readLine()) != null) {
            	num++;
            	
            	if (num == 1) {
            		continue;
            	}
            	
                String[] temp = line.split(",");
                
                try {
                	result.add(temp);
                }
                catch (Exception e) {
                	break;
                }
                
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
            
        } catch (IOException e) {
            e.printStackTrace();
            
        } finally {
        	
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
	}
}