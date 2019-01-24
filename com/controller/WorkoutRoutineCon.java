package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.UserDAO;
import com.model.UserVO;
import com.model.WorkOutDAO;
import com.model.WorkOutDTO;

public class WorkoutRoutineCon implements ICommand {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("uid");
		WorkOutDAO dao = new WorkOutDAO();
		UserDAO userDao = new UserDAO();
		int grade = userDao.getGrade(uid);
		int progress = userDao.getProgress(uid);
		
		UserVO userVo = new UserVO();
		userVo.setId(uid);
		userVo.setGrade(grade);
		userVo.setProgress(progress);
		ArrayList<WorkOutDTO> realroutine = new ArrayList<>();
		/*JsonObject jsonfin = new JsonObject();
		JsonArray jsonarr = new JsonArray();*/
		
		if (progress == 1 || progress == 2 || progress == 4 || progress == 5) {
			ArrayList<WorkOutDTO> workoutroutine = dao.WorkOutRoutine(userVo);
			if (1<=grade && grade<10) {
				for(int i = 0; i<workoutroutine.size(); i++) {
					if(Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==1 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==2 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==3) {
						realroutine.add(workoutroutine.get(i));
						
						/*JsonObject jsonObj = new JsonObject();
						jsonObj.addProperty("workoutclass",workoutroutine.get(i).getWorkoutclass());
						jsonObj.addProperty("workoutname",workoutroutine.get(i).getWorkoutname());
						jsonObj.addProperty("workouturl",workoutroutine.get(i).getWorkouturl());
						jsonObj.addProperty("workoutscore",workoutroutine.get(i).getWorkoutscore());
						jsonObj.addProperty("workoutorder",workoutroutine.get(i).getWorkoutorder());
						jsonarr.add(jsonObj);*/
					} 
				}
			} else if (10<=grade && grade <20) {
				for(int i = 0; i<workoutroutine.size(); i++) {
					if(Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==1 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==3 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==4) {
						realroutine.add(workoutroutine.get(i));
						/*JsonObject jsonObj = new JsonObject();
						jsonObj.addProperty("workoutclass",workoutroutine.get(i).getWorkoutclass());
						jsonObj.addProperty("workoutname",workoutroutine.get(i).getWorkoutname());
						jsonObj.addProperty("workouturl",workoutroutine.get(i).getWorkouturl());
						jsonObj.addProperty("workoutscore",workoutroutine.get(i).getWorkoutscore());
						jsonObj.addProperty("workoutorder",workoutroutine.get(i).getWorkoutorder());
						jsonarr.add(jsonObj);*/
					} 
				}
			} else if (20<=grade && grade <= 30) {
				for(int i = 0; i<workoutroutine.size(); i++) {
					if(Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==1 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==3 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==4 || Integer.parseInt(workoutroutine.get(i).getWorkoutorder())==5) {
						realroutine.add(workoutroutine.get(i));
						/*JsonObject jsonObj = new JsonObject();
						jsonObj.addProperty("workoutclass",workoutroutine.get(i).getWorkoutclass());
						jsonObj.addProperty("workoutname",workoutroutine.get(i).getWorkoutname());
						jsonObj.addProperty("workouturl",workoutroutine.get(i).getWorkouturl());
						jsonObj.addProperty("workoutscore",workoutroutine.get(i).getWorkoutscore());
						jsonObj.addProperty("workoutorder",workoutroutine.get(i).getWorkoutorder());
						jsonarr.add(jsonObj);*/
					} 
				}
			} 
			}
		
		session.setAttribute("realroutine", realroutine);
		
	
	}
}
