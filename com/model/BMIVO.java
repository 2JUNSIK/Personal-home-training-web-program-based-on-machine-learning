package com.model;

public class BMIVO {
	private double BMI;
	private String result;

	public BMIVO(double bMI, String result) {
		this.BMI = bMI;
		this.result = result;
	}
	public double getBMI() {
		return BMI;
	}
	public void setBMI(double bMI) {
		this.BMI = bMI;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
