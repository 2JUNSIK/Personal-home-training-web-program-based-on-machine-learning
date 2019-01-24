package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserVO;

public class LoginCon implements ICommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
	
		vo.setId(id);
		vo.setPw(pw);
		
		String uname = dao.Health_LOGIN(vo);
		if(uname!=null) {
			HttpSession session =  request.getSession();
			session.setAttribute("uname", uname);
			session.setAttribute("uid", id);
		}else {
			System.out.println("Login fail");
		}
	}
}
