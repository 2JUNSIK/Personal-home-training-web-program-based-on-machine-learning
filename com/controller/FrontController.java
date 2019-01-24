package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();

		String contextPath = request.getContextPath();

		String command = requestURI.substring(contextPath.length());

		request.setCharacterEncoding("utf-8");

		String nextPage = null;
		ICommand icom = null;

		switch (command) {

		case "/Login.do":
			icom = new LoginCon();
			icom.execute(request, response);
			nextPage = "main.jsp";
			break;

		case "/Join.do":

			icom = new JoinCon();
			icom.execute(request, response);
			nextPage = "body_list.jsp";
			break;

		case "/Body.do":

			icom = new BodyCon();
			icom.execute(request, response);
			nextPage = "main.jsp";
			break;

		case "/Logout.do":

			icom = new BodyCon();
			icom.execute(request, response);
			nextPage = "main.jsp";
			break;
		case "/UserInfo1.do":

			icom = new UserInfo1Con();
			icom.execute(request, response);
			nextPage = "member_list.jsp";
			break;

		case "/UserInfo2.do":

			icom = new UserInfo2Con();
			icom.execute(request, response);
			nextPage = "member_goal_list.jsp";
			break;
		
		case "/WorkoutRoutine.do":
			icom = new WorkoutRoutineCon();
			icom.execute(request, response);
			nextPage = "recommend_exercise.jsp";
			break;
		
		case "/WorkoutScore.do" : 
			icom = new WorkoutScoreCon();
			icom.execute(request, response);
			nextPage = "main.jsp";
			break;
			
		case "/exerciseList.do" : 
			icom = new exerciseListCon();
			icom.execute(request, response);
			nextPage = "exerciseList.jsp";
			break;
			
		case "/shou_back.do" : 
			icom = new shou_backCon();
			icom.execute(request, response);
			nextPage = "shou_back.jsp";
			break;
		
		case "/chest.do" : 
			icom = new chestCon();
			icom.execute(request, response);
			nextPage = "chest.jsp";
			break;
		
		case "/leg.do" : 
			icom = new legCon();
			icom.execute(request, response);
			nextPage = "leg.jsp";
			break;
		
		case "/choco.do" : 
			icom = new chocoCon();
			icom.execute(request, response);
			nextPage = "choco.jsp";
			break;
		default:
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
