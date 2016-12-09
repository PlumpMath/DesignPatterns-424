package com.ucd.furniture;

public class Door implements Furniture {

	
	
	public Door(double width, double height){
		this.width = width;
		this.height = height;
	}

	@Override
	public String getName() {
		return NAME;
	}

	@Override
	public double getCost() {
		return COST;
		}

	@Override
	public double getWidth() {
		return width;
	}

	@Override
	public double getHeight() {
		
		return height;
	}
	
	private String NAME = "Door";
	private double COST = 12.50 , width , height;
}
