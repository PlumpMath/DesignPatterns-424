package com.ucd.interior.shop;


import java.util.ArrayList;
import java.util.List;

import com.ucd.architectures.DefaultStyle;
import com.ucd.architectures.Style;
import com.ucd.furniture.Bed;
import com.ucd.furniture.Closet;
import com.ucd.furniture.Door;
import com.ucd.furniture.Sofa;
import com.ucd.furniture.Table;
import com.ucd.furniture.Window;
import com.ucd.interior.shop.customer.service.CustomerService;
import com.ucd.interior.shop.customer.service.Issue;
import com.ucd.invoice.Buyable;

public class InteriorDecorator {
	
	private static CustomerService executive;
	
	private InteriorDecorator(){
		
	}

	public static List<Buyable> buildLivingRoom(double length, double width, double height, Style... archStyles) {
		List<Buyable> items = new ArrayList<Buyable>();
		Style style = null;
		if (archStyles != null && archStyles.length > 0) {
			style = archStyles[0];
		} else {
			style = new DefaultStyle();
		}
		items.add(new Sofa(0.3 * length, 0.4 * width, 0.1 * height, style));
		items.add(new Door(0.1 * length, 10, 0.7 * height, style));
		items.add(new Table(0.4 * length, 0.6 * width, 5, style));
		items.add(new Window(0.3 * length ,20 , 0.5 * height,style));
		return items;

	}
	
	public static List<Buyable> buildBedRoom(double length , double width , double height , Style... archStyles){
		List<Buyable> items = new ArrayList<Buyable>();
		Style style = null;
		if (archStyles != null && archStyles.length > 0) {
			style = archStyles[0];
		} else {
			style = new DefaultStyle();
		}
		items.add(new Window(0.3 * length ,20 , 0.5 * height,style));
		items.add(new Bed(0.7 * length, 0.5 * width, 0.3 * height, style));
		items.add(new Door(0.1 * length, 10, 0.7 * height, style));
		items.add(new Closet(0.4 * length, 0.3 * width, 0.8 * height, style));
		return items;
	}
	
	public static void setExecutive(CustomerService executive) {
		InteriorDecorator.executive = executive;
	}

	public static void raiseIssue(Issue issue){
		executive.handleRequest(issue);
	}
}
