package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getCelebrity
 */
@WebServlet("/getCelebrity")
public class getCelebrity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		csvReader csv = new csvReader();
		String[] cel = csv.getRandomCelebrityIMG();
		String json = makeJson(cel);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println(json);
	}
	
	public String makeJson(String[] csv) {
	      String s = "{\"imgs\":[{\"title\": \""+ csv[2]+"\",\"path\": \""+csv[3]+"\"}]}";
	      
	      return s;
	   }
}
