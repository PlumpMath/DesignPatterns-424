package com.ucd.invoice;

import java.util.ArrayList;
import java.util.List;

public class Invoice {

	private Invoice(String shopName, String clientName, double percentDiscount, PaymentMode paymentMode,
			List<Buyable> purchased) {

		this.shopName = shopName;
		this.clientName = clientName;
		this.percentDiscount = percentDiscount;
		this.paymentMode = paymentMode;
		this.purchased = purchased;
	}

	public double calculateTotalCost() {

		double total_cost = 0;
		for (Buyable item : purchased) {
			total_cost += item.getCost();
		}

		total_cost -= (percentDiscount * total_cost);
		return total_cost;

	}

	public void addItem(Buyable newItem) {
		purchased.add(newItem);

	}

	public void removeItem(Buyable itemToRemove) {

		purchased.remove(itemToRemove);

	}

	@Override
	public String toString() {
		String output = "Component_Name\tComponent_Cost\n---------------------\n";

		for (Buyable item : purchased) {
			output += (item.getName()) + " " + item.getCost() + "\n";
		}
		if (percentDiscount > 0.0) {
			output += "Discount : " + (percentDiscount * 100) + "%\n";
		}
		output += "--------------------\nTotal Cost : " + calculateTotalCost() + "\n";

		return output;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public void setPercentDiscount(double percentDiscount) {
		this.percentDiscount = percentDiscount;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = PaymentMode.valueOf(paymentMode.toUpperCase());
	}

	public String getClientName() {
		return clientName;
	}

	public String getPaymentMode() {
		if (paymentMode != null)
			return paymentMode.name();
		else
			return "";
	}

	public String getShopName() {
		return shopName;
	}

	public List<Buyable> getPurchased() {
		return purchased;
	}

	public double getPercentDiscount() {
		return percentDiscount;
	}

	public static class InvoiceBuilder {

		public InvoiceBuilder shopName(String shopName) {
			this.shopName = shopName;
			return this;
		}

		public InvoiceBuilder clientName(String clientName) {
			this.clientName = clientName;
			return this;
		}

		public InvoiceBuilder percentDiscount(double percentDiscount) {
			this.percentDiscount = percentDiscount;
			return this;
		}

		public InvoiceBuilder paymentMode(String paymentMode) {
			this.paymentMode = PaymentMode.valueOf(paymentMode.toUpperCase());
			return this;
		}

		public InvoiceBuilder item(Buyable newItem) {
			purchased.add(newItem);
			return this;
		}

		public Invoice generateInvoice() {
			return new Invoice(shopName, clientName, percentDiscount, paymentMode, purchased);
		}

		private List<Buyable> purchased = new ArrayList<>();
		private String shopName = "";
		private String clientName = "";
		private double percentDiscount;
		private PaymentMode paymentMode;
	}

	private List<Buyable> purchased;
	private String shopName;
	private String clientName;
	private double percentDiscount;
	private PaymentMode paymentMode;
}
