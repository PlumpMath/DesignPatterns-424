package com.ucd.clients;

import com.ucd.architectures.FrenchStyle;
import com.ucd.architectures.ModernStyle;
import com.ucd.architectures.VictorianStyle;
import com.ucd.furniture.AssembledFurniture;
import com.ucd.furniture.Block;
import com.ucd.furniture.Door;
import com.ucd.furniture.Furniture;
import com.ucd.furniture.Window;
import com.ucd.interior.shop.InteriorDecorator;
import com.ucd.interior.shop.customer.service.CallExecutive;
import com.ucd.interior.shop.customer.service.CustomerService;
import com.ucd.interior.shop.customer.service.Issue;
import com.ucd.interior.shop.customer.service.Level;
import com.ucd.interior.shop.customer.service.Manager;
import com.ucd.interior.shop.customer.service.Owner;
import com.ucd.interior.shop.customer.service.Supervisor;
import com.ucd.invoice.Buyable;
import com.ucd.invoice.Invoice;

public class FurnitureShop {

	public static void main(String[] args) {
		
		Furniture f1 = new Block(7,6.5,10,new FrenchStyle());
		Furniture f2 = new Door(6,7, 25,new VictorianStyle());
		Furniture f3 = new Window(5,2,3,new ModernStyle());
		Door d = new Door(4,7, 25,new VictorianStyle());
		
		AssembledFurniture f4 = AssembledFurniture.buildFurniture(f1,f2);
		f4.addFurniture(f3);
		
		Buyable item1 = new Window(4.4,5.5,10.3);	
		Buyable item2 = f4;
		Buyable item3 = new Door(5,20,50);
		
	
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
		
		Invoice secondInvoice = new Invoice.InvoiceBuilder()
				.shopName("DESIGN")
				.clientName("XYZ")
				.items(InteriorDecorator.buildLivingRoom(30, 60, 20))
				.paymentMode("Card")
				.generateInvoice();
		
		System.out.println(secondInvoice);
		
		Invoice thirdInvoice = new Invoice.InvoiceBuilder()
				.shopName("DESIGN")
				.clientName("PQR")
				.items(InteriorDecorator.buildBedRoom(60, 90, 40, new VictorianStyle()))
				.paymentMode("Card")
				.generateInvoice();
		
		System.out.println(thirdInvoice);
		
		CustomerService callExecutive = new CallExecutive();
		CustomerService manager = new Manager();
		CustomerService supervisor = new Supervisor();
		CustomerService owner = new Owner();
		
		callExecutive.setNextEmployee(manager);
		manager.setNextEmployee(supervisor);
		supervisor.setNextEmployee(owner);
		InteriorDecorator.setExecutive(callExecutive);

		
		Issue issueOne = new Issue(invoice.getInvoiceId(), Level.LOW, "Window is jammed");
		InteriorDecorator.raiseIssue(issueOne);

		Issue issueTwo = new Issue(secondInvoice.getInvoiceId(), Level.MODERATE, "Leather of sofa is torn");
		InteriorDecorator.raiseIssue(issueTwo);

		Issue issueThree = new Issue(thirdInvoice.getInvoiceId(), Level.HIGH, "Closet door isn't opening");
		InteriorDecorator.raiseIssue(issueThree);

		Issue issueFour = new Issue(thirdInvoice.getInvoiceId(), Level.SEVERE, "All the furniture crashed!!!");
		InteriorDecorator.raiseIssue(issueFour);


		

	}

}
