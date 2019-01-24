package com.model;

public class CookingVO {
	String name;
	int calorie, protein;
	public CookingVO(String name, int calorie, int protein) {
		super();
		this.name = name;
		this.calorie = calorie;
		this.protein = protein;
	}
	public CookingVO() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	
	
	
	
}
