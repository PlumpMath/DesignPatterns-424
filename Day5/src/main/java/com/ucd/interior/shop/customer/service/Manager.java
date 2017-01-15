package com.ucd.interior.shop.customer.service;

public class Manager extends CustomerService{

	@Override
	public void handleRequest(Issue issue) {
		if(issue.getLevel() == Level.MODERATE){
			System.out.println("Manager handled issue " + issue.getIssueId());
			issue.setStatus(Status.RESOLVED); 
			issue.setHandledBy(this);

		}
		else{
			nextEmployee.handleRequest(issue);
		}
		
	}

}
