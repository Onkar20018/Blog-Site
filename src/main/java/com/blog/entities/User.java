package com.blog.entities;

import java.sql.*;

public class User 
{
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String profile;
	private String about;
	
	public User()
	{
		
	}
	public User(int id, String name, String email,String password, String gender ,String profile, String about) 
	{
		this.name=name;
		this.email=email;
		this.password=password;
		this.gender=gender;
		this.profile=profile;
		this.about=about;
		this.id=id;
	}
	public User(int id, String name, String email, String gender ,String profile, String about) 
	{
		this.name=name;
		this.email=email;
		this.gender=gender;
		this.profile=profile;
		this.about=about;
		this.id=id;
	}
	
	
	public User( String name, String email,String password, String gender,String profile,String about) 
	{
		this.name=name;
		this.email=email;
		this.password=password;
		this.gender=gender;
		this.profile=profile;
		this.about=about;
	}

	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
