package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getDiet
 */
@WebServlet("/getDiet")
public class getDiet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		csvReader csv = new csvReader();
		ArrayList<String[]> img = csv.getRandomIMG();
		String json = makeJson(img);
		PrintWriter out = response.getWriter();
		out.print(json);
		
	}
	
	public String makeJson(ArrayList<String[]> csv) {
		String s = "{\"imgs\":[";
		
		for(int i=0;i<csv.size();i++) {
			s += "{"; 
			s += " \"title\": \""+ csv.get(i)[2]+"\",";
			s += "\"path\": \""+csv.get(i)[3]+"\"";
			if(i==csv.size()-1) {
				s+= "}]}";
			}else {
				s += "},";
			}
		}
		
		return s;
	}

}
