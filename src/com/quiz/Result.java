package com.quiz;

public class Result {
	private String username;
	private float score;
	
	public Result() {
		
	}
	
	public Result(String username, float score) {
		this.username = username;
		this.score = score;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public float getScore() {
		return score;
	}
	
	public void setScore(float score) {
		this.score = score;
	}
}
