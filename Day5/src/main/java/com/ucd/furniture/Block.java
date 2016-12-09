package com.ucd.furniture;

public class Block implements Furniture {
	
	
	public Block(double width, double height){
		this.width = width;
		this.height = height;
	}

	@Override
	public double getCost() {
		return COST;
		}


	@Override
	public String getName() {
		return NAME;
	}

	@Override
	public double getWidth() {
		return width;
	}

	@Override
	public double getHeight() {
		
		return height;
	}
	private String NAME = "Block";
	private double COST = 10.00, width , height;
	
	


}
