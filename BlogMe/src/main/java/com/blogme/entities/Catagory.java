package com.blogme.entities;

public class Catagory {
	private int idcatagories;
	private String name;
	private String description;
	
//	Constructors
	
	public Catagory(int idcatagories, String name, String description) {
		this.idcatagories = idcatagories;
		this.name = name;
		this.description = description;
	}

	public Catagory() {
		
	}

	public Catagory(String name, String description) {
		this.name = name;
		this.description = description;
	}

//	getters and setters
	
	public int getIdcatagories() {
		return idcatagories;
	}

	public void setIdcatagories(int idcatagories) {
		this.idcatagories = idcatagories;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	} 
	
}
