package com.cloud.model;

public class Employee {
	private Integer id;
	private String email;
	private String password;
	private String emailmd5;
	private String randommd5;
	private String isactivate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailmd5() {
		return emailmd5;
	}
	public void setEmailmd5(String emailmd5) {
		this.emailmd5 = emailmd5;
	}
	public String getRandommd5() {
		return randommd5;
	}
	public void setRandommd5(String randommd5) {
		this.randommd5 = randommd5;
	}
	public String getIsactivate() {
		return isactivate;
	}
	public void setIsactivate(String isactivate) {
		this.isactivate = isactivate;
	}
	
	
}
