package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserVO;

public class WorkoutScoreCon implements ICommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String score = request.getParameter("score");
			HttpSession session = request.getSession();
			String uid = (String)session.getAttribute("uid");
			UserDAO dao = new UserDAO();
			int userGrade = dao.getGrade(uid);
			int userProgress = dao.getProgress(uid);
			if(userProgress<5) {
				userProgress++;
			} else {
				userProgress = 1;
			}
			if (score.equals("easy")) {
				userGrade++;
			} else if (score.equals("difficult")) {
				userGrade--;
			} 
			UserVO vo = new UserVO();
			vo.setId(uid);
			vo.setProgress(userProgress);
			vo.setGrade(userGrade);
			
			int cnt = dao.updateUserDayScore(vo);
			if (cnt>0) {
				System.out.println("난이도 조절 성공");
			} else {
				System.out.println("난이도 조절 실패");
			}
		
	} }
