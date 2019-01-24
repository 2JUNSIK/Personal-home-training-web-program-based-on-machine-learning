package com.model;

public class UserVO {
	/* 회원의 개인정보 */
	private String name;
	private String id;
	private String pw;
	private String email;
	private int age;
	private String gender;
	private String address;
	private String hp;
	private int grade;
	private int progressdate;
	private int progress;
	
	public UserVO() {
	
	}

	public UserVO(String name, String id, String pw, String email, int age, String gender, String address, String hp,
			int grade, int progressdate, int progress) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.hp = hp;
		this.grade = grade;
		this.progressdate = progressdate;
		this.progress = progress;
	}


	public int getProgressdate() {
		return progressdate;
	}


	public void setProgressdate(int progressdate) {
		this.progressdate = progressdate;
	}


	public int getProgress() {
		return progress;
	}


	public void setProgress(int progress) {
		this.progress = progress;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}


}
