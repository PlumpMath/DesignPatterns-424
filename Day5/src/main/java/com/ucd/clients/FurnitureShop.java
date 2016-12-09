package com.ucd.clients;

import com.ucd.furniture.AssembledFurniture;
import com.ucd.furniture.Block;
import com.ucd.furniture.Door;
import com.ucd.furniture.Furniture;
import com.ucd.furniture.Window;
import com.ucd.invoice.Buyable;
import com.ucd.invoice.Invoice;

public class FurnitureShop {

	public static void main(String[] args) {
		
		Furniture f1 = new Block(6.5,10);
		Furniture f2 = new Door(7, 25);
		Furniture f3 = new Window(2,3);
		
		AssembledFurniture f4 = AssembledFurniture.buildFurniture(f1,f2);
		f4.addFurniture(f3);
		
		Buyable item1 = new Window(5.5,10.3);	
		Buyable item2 = f4;
		Buyable item3 = new Door(20,50);
		
	
		Invoice invoice = new Invoice.InvoiceBuilder()
				.shopName("DESIGN")
				.clientName("ABC")
				.item(item1)
				.item(item2)
				.item(item3)
				.percentDiscount(0.3)
				.paymentMode("Card")
				.generateInvoice();
		
		System.out.println(invoice);
	}

}
