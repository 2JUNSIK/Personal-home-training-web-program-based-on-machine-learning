package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;

/**
 * Servlet implementation class getBMI
 */
@WebServlet("/getBMI")
public class getBMI extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
    */
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      
      String id = session.getAttribute("uid").toString(); ; // 추후에 세션이든 뭐든 받아서 저장
      UserDAO dao = new UserDAO();
      String[] hwga = dao.gethweight(id);
      double height = Float.parseFloat(hwga[0])/100.0;
      double weight = Float.parseFloat(hwga[1]);
      String gender = hwga[2];
      int age = Integer.parseInt(hwga[3]);
      double BMI = weight/(height*height);
      String result;

      if(age<19) {
         if(gender.equals("male")) {
            if(BMI>=24.48) { result = "비만";
            }else if(BMI>=21.71) { result = "과체중";
            }else if(BMI>=14.57) { result = "정상";
            }else{ result = "저체중"; 
            }
         
         }else {
            if(BMI>=26.11) { result = "비만";
            }else if(BMI>=23.67) { result = "과체중";
            }else if(BMI>=16.78) { result = "정상";
            }else{ result = "저체중"; 
            }
         }

      }else {
         if(BMI>=30) { result = "고도비만";
         }else if(BMI>=25) { result = "비만";
         }else if(BMI>=23) { result = "과체중";
         }else if(BMI>=18.5) { result = "정상";
         }else{ result = "저체중"; 
         }
      }
      String bmi = String.format("%.2f", BMI);
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String json = "{\"bmi\":[{\"BMI\": \""+ bmi+"\",\"result\": \""+result+"\"}]}";
         
      System.out.println(json);
      out.print(json);
   }

}