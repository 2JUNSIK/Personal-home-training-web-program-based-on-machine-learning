package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserVO;

public class UserInfo1Con implements ICommand {

   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      
      UserDAO dao = new UserDAO();
      
      ArrayList<UserVO> userList = dao.AllUserInfo();
      
      if (userList != null) {
    	  session.setAttribute("userList", userList);
    	  session.setAttribute("listLength", userList.size());
      } else {
    	  
      }
   }

}