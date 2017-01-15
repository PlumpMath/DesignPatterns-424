package com.ucd.interior.shop.customer.service;

public abstract class CustomerService {
	
	protected CustomerService nextEmployee;
	
	public void setNextEmployee(CustomerService nextEmployee){
		this.nextEmployee = nextEmployee;
	}

	abstract public void handleRequest(Issue issue);
	
}
