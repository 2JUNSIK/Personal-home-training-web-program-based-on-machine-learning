package com.model;

public class WorkOutDTO {
	private String workoutclass;
	private String workoutname;
	private String workouturl;
	private int workoutscore;
	private String workoutorder;
	
	public WorkOutDTO() {}
	
	public WorkOutDTO(String workoutclass, String workoutname, String workouturl, int workoutscore,
			String workoutorder) {
		super();
		this.workoutclass = workoutclass;
		this.workoutname = workoutname;
		this.workouturl = workouturl;
		this.workoutscore = workoutscore;
		this.workoutorder = workoutorder;
	}

	public String getWorkoutclass() {
		return workoutclass;
	}
	public void setWorkoutclass(String workoutclass) {
		this.workoutclass = workoutclass;
	}
	public String getWorkoutname() {
		return workoutname;
	}
	public void setWorkoutname(String workoutname) {
		this.workoutname = workoutname;
	}
	public String getWorkouturl() {
		return workouturl;
	}
	public void setWorkouturl(String workouturl) {
		this.workouturl = workouturl;
	}
	public int getWorkoutscore() {
		return workoutscore;
	}
	public void setWorkoutscore(int workoutscore) {
		this.workoutscore = workoutscore;
	}
	public String getWorkoutorder() {
		return workoutorder;
	}
	public void setWorkoutorder(String workoutorder) {
		this.workoutorder = workoutorder;
	}
	
	
}
