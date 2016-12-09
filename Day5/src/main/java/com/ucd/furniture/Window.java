package com.ucd.furniture;

public class Window implements Furniture {

	
	public Window(double width , double height){
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

	private String NAME = "Window";
	private double COST = 17.50, width , height;

}
