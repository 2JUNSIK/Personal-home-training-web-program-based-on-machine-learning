package com.model;

public class UserDetailVO {
	/* 회원 신체정보 */
	private String id;
	private String height;
	private String weight;
	private String muscle;
	private String targetPeriod;
	private String targetAmount;
	private String desirePart;
	private String burglar;
	private String homeorGym;
	private String bodyShape;
	
	
	public UserDetailVO() {
	}

	public UserDetailVO(String id, String height, String weight, String muscle, String targetPeriod,
			String targetAmount, String desirePart, String burglar, String homeorGym, String bodyShape) {
		this.id = id;
		this.height = height;
		this.weight = weight;
		this.muscle = muscle;
		this.targetPeriod = targetPeriod;
		this.targetAmount = targetAmount;
		this.desirePart = desirePart;
		this.burglar = burglar;
		this.homeorGym = homeorGym;
		this.bodyShape = bodyShape;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getMuscle() {
		return muscle;
	}

	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}

	public String getTargetPeriod() {
		return targetPeriod;
	}

	public void setTargetPeriod(String targetPeriod) {
		this.targetPeriod = targetPeriod;
	}

	public String getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}

	public String getDesirePart() {
		return desirePart;
	}

	public void setDesirePart(String desirePart) {
		this.desirePart = desirePart;
	}

	public String getBurglar() {
		return burglar;
	}

	public void setBurglar(String burglar) {
		this.burglar = burglar;
	}

	public String getHomeorGym() {
		return homeorGym;
	}

	public void setHomeorGym(String homeorGym) {
		this.homeorGym = homeorGym;
	}

	public String getBodyShape() {
		return bodyShape;
	}

	public void setBodyShape(String bodyShape) {
		this.bodyShape = bodyShape;
	}
	
		
}
