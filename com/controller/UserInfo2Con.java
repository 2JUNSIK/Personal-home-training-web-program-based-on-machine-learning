package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserDetailVO;

public class UserInfo2Con implements ICommand {

   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      UserDAO dao = new UserDAO();
      
      ArrayList<UserDetailVO> userList2 = dao.AllUserInfo2();
      
      if (userList2 != null) {
    	  HttpSession session = request.getSession();
         session.setAttribute("userList2", userList2);
         session.setAttribute("listLength2", userList2.size());
         
      } else {
      }
   }

}