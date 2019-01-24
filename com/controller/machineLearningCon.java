package com.controller;

import java.io.IOException;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;

@WebServlet("/machineLearning")
public class machineLearningCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			UserDAO dao = new UserDAO();
			String[] userArr = dao.getMemInfo((String)session.getAttribute("uid"));
			String age = userArr[1];			
			String gender = userArr[2];
			String height = request.getParameter("height");
			String weight = request.getParameter("weight");
			String muscle = request.getParameter("muscle");
			String pushup = request.getParameter("pushup");
			
			if (muscle.equals("표준이하")) {
				muscle = "30";
			} else if (muscle.equals("표준")) {
				muscle = "40";
			} else {
				muscle = "50";
			}
			if (pushup.equals("하")) {
				pushup = "10";
			} else if (pushup.equals("중")) {
				pushup = "30";
			} else {
				pushup = "60";
			}
			
			String url = "C:\\Users\\VDI02\\Desktop\\ML_situp\\";
			
			if (gender.equals("male")) {
				url+="situp_male_unsuper.py";
			} else {
				url+="situp_female_unsuper.py";
			}
			
			ProcessBuilder builder = new ProcessBuilder("C:\\Users\\VDI02\\AppData\\Local\\Continuum\\anaconda3\\python.exe",url,age,height,weight,muscle,pushup);
			Process process = builder.start();
			Scanner errorScanner = new Scanner(process.getErrorStream());
			Scanner outputScanner = new Scanner(process.getInputStream());
		
			try {
				process.waitFor();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			// ���� ��Ʈ�� from ���̽�����
			while(errorScanner.hasNext()) {
				System.out.println(errorScanner.nextLine());
			}
			
			errorScanner.close();
			String userClass = "";
		
			while(outputScanner.hasNext()) {
				userClass+=outputScanner.nextLine();
			}
			System.out.println(userClass);
			session.setAttribute("userGrade", userClass);
			outputScanner.close();
			response.setContentType("text/html; charset = utf-8");
			response.getWriter().println(userClass);
		}
	
	}


