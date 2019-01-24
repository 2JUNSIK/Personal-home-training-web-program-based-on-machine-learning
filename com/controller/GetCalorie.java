package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CookingDAO;

@WebServlet("/calorie")
public class GetCalorie extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String SearchedFood = URLDecoder.decode(request.getParameter("SearchedFood"), "UTF-8");
      CookingDAO DAO = new CookingDAO();
      
      System.out.println(SearchedFood);
      String[] SearchFoods= DAO.searchCookingInfo(SearchedFood);
      
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String json = "{\"cooking\":[{\"name\": \""+ SearchFoods[0]+"\",\"cal\": \""+SearchFoods[1]+"\"}]}";
      out.println(json);
   
      
      
      
   }

}