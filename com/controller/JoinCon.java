package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.model.UserDAO;
import com.model.UserVO;

public class JoinCon implements ICommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age= Integer.parseInt(request.getParameter("age"));
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String hp = request.getParameter("hp");
		
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO(name,id,pw,email,age,gender,hp,address,0,0,0);
		
		int cnt = dao.Health_JOIN(vo);
		
		if (cnt > 0) {
			System.out.println("JOIN basic sucess");
			HttpSession session = request.getSession();
			session.setAttribute("uid", id);
			
		} else {
			System.out.println("JOIN basic fail");
		}
		
	}
}
