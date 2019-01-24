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
import com.model.UserVO;

@WebServlet("/userClassify")
public class userClassifyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userGrade = request.getParameter("userGrade");
		String id = (String)session.getAttribute("uid");
		int userScore;
		if (userGrade.equals("[0]")) {
			userScore = 8;
		} else if (userGrade.equals("[1]")) {
			userScore = 5;
		} else {
			userScore = 3;
		}
		int userProgress = 1;
		UserVO vo = new UserVO();
		vo.setGrade(userScore);
		vo.setProgress(userProgress);
		vo.setId(id);
		UserDAO dao = new UserDAO();
		int cnt = dao.updateUserDayScore(vo);
		if (cnt>0) {
			PrintWriter out = response.getWriter();
			out.print("����");
		} else {
			System.out.println("updateuserdayscore failure");
		}
		
	}

}
