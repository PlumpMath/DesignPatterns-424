package com.ucd.furniture;

import com.ucd.invoice.Buyable;

public interface Furniture extends Buyable {
	
		
	default void addFurniture(Furniture newFurniture){
		throw new RuntimeException("This method shouldn't be called for a leaf node");
	}
	
	default void removeFurniture(Furniture discardedFurniture){
		throw new RuntimeException("This method shouldn't be called for a leaf node");

	}
	
	double getWidth();
	
	double getHeight();

}
