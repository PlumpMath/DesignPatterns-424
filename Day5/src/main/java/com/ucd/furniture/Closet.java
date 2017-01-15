package com.ucd.furniture;

import com.ucd.architectures.DefaultStyle;
import com.ucd.architectures.Style;

public class Closet extends Furniture {

	public Closet(double length, double width, double height) {
		super(new DefaultStyle());
		this.length = length;
		this.width = width;
		this.height = height;
	}

	public Closet(double length, double width, double height, Style archStyle) {
		super(archStyle);
		this.length = length;
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

	@Override
	public double getLength() {
		return length;
	}

	@Override
	public void applyStyle() {
		archStyle.applyStyle();
	}

	private String NAME = "Closet";
	private double COST = 25.00, length, width, height;

}
