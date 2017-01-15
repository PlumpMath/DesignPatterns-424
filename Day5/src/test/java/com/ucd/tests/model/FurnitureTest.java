package com.ucd.tests.model;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import com.ucd.architectures.DefaultStyle;
import com.ucd.architectures.ModernStyle;
import com.ucd.furniture.AssembledFurniture;
import com.ucd.furniture.Block;
import com.ucd.furniture.Door;
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
import com.ucd.invoice.PaymentMode;
import com.ucd.invoice.Invoice.InvoiceBuilder;

public class FurnitureTest {
	@Test
	public void testWood() {
		Window window = new Window(7.0,5.0, 10.0);
		assertEquals("Incorrect length ", 7.0, window.getLength(), 0);
		assertEquals("Incorrect width ", 5.0, window.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, window.getHeight(), 0);
		assertEquals("Incorrect name ", "Window", window.getName());
		assertEquals("Incorrect cost ", 17.50, window.getCost(), 0);

	}

	@Test
	public void testBlock() {
		Block block = new Block(3.0,5.0, 10.0);
		assertEquals("Incorrect length ", 3.0, block.getLength(), 0);
		assertEquals("Incorrect width ", 5.0, block.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, block.getHeight(), 0);
		assertEquals("Incorrect name ", "Block", block.getName());
		assertEquals("Incorrect cost ", 10.00, block.getCost(), 0);

	}

	@Test
	public void testDoor() {
		Door door = new Door(2.0,5.0, 10.0);
		assertEquals("Incorrect length ", 2.0, door.getLength(), 0);
		assertEquals("Incorrect width ", 5.0, door.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, door.getHeight(), 0);
		assertEquals("Incorrect name ", "Door", door.getName());
		assertEquals("Incorrect cost ", 12.50, door.getCost(), 0);

	}

	@Test
	public void testAssembledFurniture() {
		Window window = new Window(7.0,5.0, 10.0);
		Block block = new Block(3.0,5.0, 10.0);
		Door door = new Door(2.0,5.0, 10.0);
		AssembledFurniture layout = AssembledFurniture.buildFurniture(window, block, door);
		assertEquals("Incorrect length ", 12.0, layout.getLength(), 0);
		assertEquals("Incorrect width ", 15.0, layout.getWidth(), 0);
		assertEquals("Incorrect height ", 30.0, layout.getHeight(), 0);
		assertEquals("Incorrect name ", "Window , Block , Door , ", layout.getName());
		assertEquals("Incorrect cost ", 40.00, layout.getCost(), 0);

	}

	@Test
	public void testInvoice() {

		Window window = new Window(7.0,5.0, 10.0);
		Block block = new Block(3.0,5.0, 10.0);

		Invoice invoice = new Invoice.InvoiceBuilder().shopName("DESIGN").clientName("ABC").item(window).item(block)
				.percentDiscount(0.3).paymentMode("Cash").generateInvoice();

		assertEquals("DESIGN", invoice.getShopName());
		assertEquals("ABC", invoice.getClientName());
		assertEquals(2, invoice.getPurchased().size());
		assertEquals(PaymentMode.CASH.name(), invoice.getPaymentMode());
		assertEquals(19.25, invoice.calculateTotalCost(), 0);

		AssembledFurniture layout = AssembledFurniture.buildFurniture(window, block);
		invoice.addItem(layout);
		assertEquals(38.5, invoice.calculateTotalCost(), 0);

	}

	@Test
	public void testInvoiceMisingValues() {

		Window window = new Window(7,5.0, 10.0);
		Block block = new Block(3,5.0, 10.0);
		Invoice invoice = new Invoice.InvoiceBuilder().item(window).item(block).generateInvoice();
		assertEquals(2, invoice.getPurchased().size());
		assertEquals("", invoice.getShopName());
		assertEquals("", invoice.getClientName());
		assertEquals("", invoice.getPaymentMode());
		assertEquals(27.5, invoice.calculateTotalCost(), 0);
	}
	
	@Test
	public void testStyles(){
		Door door = new Door(2.5,10.5 , 6.0);
		assertEquals(new DefaultStyle().getClass(),door.getArchStyle().getClass());
		Window window = new Window(7,5.0,10.0,new ModernStyle());
		assertEquals(new ModernStyle().getClass(),window.getArchStyle().getClass());
		
	}
	
	@Test
	public void testInteriorDecorator(){
		List<Buyable> items = InteriorDecorator.buildLivingRoom(30, 30, 30);
		Invoice invoice = new Invoice.InvoiceBuilder().items(items).generateInvoice();
		assertEquals(4 , items.size(),0);
		assertEquals(80,invoice.calculateTotalCost(),0);
		
		items = InteriorDecorator.buildBedRoom(30, 30, 30);
		invoice = new Invoice.InvoiceBuilder().items(items).generateInvoice();
		assertEquals(4 , items.size(),0);
		assertEquals(105,invoice.calculateTotalCost(),0);

		
	}
	
	@Test
	public void testCustomerServiceChain(){
		
		Invoice invoice = new Invoice.InvoiceBuilder().generateInvoice();
		Invoice secondInvoice = new Invoice.InvoiceBuilder().generateInvoice();
		Invoice thirdInvoice = new Invoice.InvoiceBuilder().generateInvoice();


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
		
		assertEquals(callExecutive , issueOne.getHandledBy());
		assertEquals(manager , issueTwo.getHandledBy());
		assertEquals(supervisor , issueThree.getHandledBy());
		assertEquals(owner , issueFour.getHandledBy());

	}

}
