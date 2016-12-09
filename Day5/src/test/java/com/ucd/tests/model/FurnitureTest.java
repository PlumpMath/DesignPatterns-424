package com.ucd.tests.model;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.ucd.furniture.AssembledFurniture;
import com.ucd.furniture.Block;
import com.ucd.furniture.Door;
import com.ucd.furniture.Window;
import com.ucd.invoice.Invoice;
import com.ucd.invoice.PaymentMode;

public class FurnitureTest {
	@Test
	public void testWood() {
		Window window = new Window(5.0, 10.0);

		assertEquals("Incorrect width ", 5.0, window.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, window.getHeight(), 0);
		assertEquals("Incorrect name ", "Window", window.getName());
		assertEquals("Incorrect cost ", 17.50, window.getCost(), 0);

	}

	@Test
	public void testBlock() {
		Block block = new Block(5.0, 10.0);

		assertEquals("Incorrect width ", 5.0, block.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, block.getHeight(), 0);
		assertEquals("Incorrect name ", "Block", block.getName());
		assertEquals("Incorrect cost ", 10.00, block.getCost(), 0);

	}

	@Test
	public void testDoor() {
		Door door = new Door(5.0, 10.0);

		assertEquals("Incorrect width ", 5.0, door.getWidth(), 0);
		assertEquals("Incorrect height ", 10.0, door.getHeight(), 0);
		assertEquals("Incorrect name ", "Door", door.getName());
		assertEquals("Incorrect cost ", 12.50, door.getCost(), 0);

	}

	@Test
	public void testAssembledFurniture() {
		Window window = new Window(5.0, 10.0);
		Block block = new Block(5.0, 10.0);
		Door door = new Door(5.0, 10.0);
		AssembledFurniture layout = AssembledFurniture.buildFurniture(window, block, door);

		assertEquals("Incorrect width ", 15.0, layout.getWidth(), 0);
		assertEquals("Incorrect height ", 30.0, layout.getHeight(), 0);
		assertEquals("Incorrect name ", "Window , Block , Door , ", layout.getName());
		assertEquals("Incorrect cost ", 40.00, layout.getCost(), 0);

	}

	@Test
	public void testInvoice() {

		Window window = new Window(5.0, 10.0);
		Block block = new Block(5.0, 10.0);

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

		Window window = new Window(5.0, 10.0);
		Block block = new Block(5.0, 10.0);
		Invoice invoice = new Invoice.InvoiceBuilder().item(window).item(block).generateInvoice();
		assertEquals(2, invoice.getPurchased().size());
		assertEquals("", invoice.getShopName());
		assertEquals("", invoice.getClientName());
		assertEquals("", invoice.getPaymentMode());
		assertEquals(27.5, invoice.calculateTotalCost(), 0);
	}

}
