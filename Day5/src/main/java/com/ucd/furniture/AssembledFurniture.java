package com.ucd.furniture;

import java.util.ArrayList;
import java.util.List;

import com.ucd.architectures.DefaultStyle;

public class AssembledFurniture extends Furniture {

	private AssembledFurniture(Furniture... elements) {
		super(new DefaultStyle());
		if (furnitures == null) {
			furnitures = new ArrayList<Furniture>();
		}

		for (Furniture f : elements) {
			furnitures.add(f);
		}

	}

	public static AssembledFurniture buildFurniture(Furniture... elements) {
		return new AssembledFurniture(elements);
	}

	@Override
	public void addFurniture(Furniture newFurniture) {
		if (furnitures == null) {
			furnitures = new ArrayList<Furniture>();
		}

		furnitures.add(newFurniture);

	}

	@Override
	public void removeFurniture(Furniture discardedFurniture) {
		if (furnitures == null)
			throw new RuntimeException("This should not have happened");
		else
			furnitures.remove(discardedFurniture);
	}

	@Override
	public String getName() {
		String name = "";
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				name += f.getName() + " , ";
			}
		}
		return name;
	}

	@Override
	public double getCost() {
		double cost = 0;
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				cost += f.getCost();
			}
		}
		return cost;
	}

	@Override
	public double getWidth() {
		double width = 0;
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				width += f.getWidth();
			}
		}
		return width;
	}

	@Override
	public double getHeight() {
		double height = 0;
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				height += f.getHeight();
			}
		}
		return height;
	}
	

	@Override
	public double getLength() {
		double length = 0;
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				length += f.getLength();
			}
		}
		return length;
	}
	
	
	@Override
	public void applyStyle(){
		if (furnitures != null) {
			for (Furniture f : furnitures) {
				f.applyStyle();
			}
		}
	}

	private List<Furniture> furnitures;

}
