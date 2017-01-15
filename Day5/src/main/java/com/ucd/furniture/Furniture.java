package com.ucd.furniture;

import com.ucd.architectures.Style;
import com.ucd.invoice.Buyable;

/*public interface Furniture extends Buyable {
	
		
	default void addFurniture(Furniture newFurniture){
		throw new RuntimeException("This method shouldn't be called for a leaf node");
	}
	
	default void removeFurniture(Furniture discardedFurniture){
		throw new RuntimeException("This method shouldn't be called for a leaf node");

	}
	
	double getWidth();
	
	double getHeight();

}*/

public abstract class Furniture implements Buyable {

	protected Furniture(Style archStyle) {
		this.archStyle = archStyle;
	}

	public void addFurniture(Furniture newFurniture) {
		throw new RuntimeException("This method shouldn't be called for a leaf node");
	}

	public void removeFurniture(Furniture discardedFurniture) {
		throw new RuntimeException("This method shouldn't be called for a leaf node");

	}

	abstract double getWidth();

	abstract double getHeight();
	
	abstract double getLength();
	
	public Style getArchStyle() {
		return archStyle;
	}

	public void applyStyle() {
		archStyle.applyStyle();
	}

	protected Style archStyle;
}
