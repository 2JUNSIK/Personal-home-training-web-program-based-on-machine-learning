package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserDetailVO;
import com.model.UserVO;

public class BodyCon implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = session.getAttribute("uid").toString();
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		String bodyShape = request.getParameter("body-fit");
		String muscle = request.getParameter("muscle-fit");
		String[] targetMuscle = request.getParameterValues("target_muscle");
		String targetAmount = request.getParameter("target_weight");
		String start = request.getParameter("start_date");
		String target = request.getParameter("target_date");
		String targetPeriod = start +"~"+target;
		String burglar = request.getParameter("burglar");
		String HorG = request.getParameter("HorG");

		String desirePart = desirePart(targetMuscle);
		if(muscle==null) {
			muscle = "";
		}
		UserDetailVO dvo = new UserDetailVO(id,height,weight,muscle,targetPeriod,targetAmount,
				desirePart,burglar,HorG,bodyShape);

		UserDAO dao = new UserDAO();
		int cnt = dao.Health_JOIN_detail(dvo);
		if(cnt>0) {
			System.out.println("Join_detail Success");
		}else {
			System.out.println("Join_detail Fail");
		}
		// grade를 health_member에 저장
			int userGrade;
			try {
				 userGrade = Integer.parseInt((String)session.getAttribute("userGrade"));
			} catch (Exception e) {
				userGrade = 0;
			}
	     
	    
	      int userProgress = 1;
	      if (userGrade==0) {
	         userGrade = 8;
	      } else if (userGrade == 1) {
	         userGrade = 5;
	      } else {
	         userGrade = 3;
	      }
	      UserVO vo = new UserVO();
	      vo.setId(id);
	      vo.setGrade(userGrade);
	      vo.setProgress(userProgress);
	      int cnt1 = dao.updateUserDayScore(vo);
	      if (cnt1>0) {
	         System.out.println("updateuserdayscore success");
	      } else {
	         System.out.println("updateuserdayscore failure");
	      }
	      session.invalidate();
	   }
	
		public String desirePart(String[] arr) {
			String desirePart = "";
			for(int i=0;i<arr.length;i++) {
				desirePart += arr[i];
				if(i!=arr.length-1) {
					desirePart += ",";
				}
			}
			return desirePart;
		}

	}
