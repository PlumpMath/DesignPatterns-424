package com.ucd.interior.shop.customer.service;

public class Supervisor extends CustomerService{

	
	@Override
	public void handleRequest(Issue issue) {
		if(issue.getLevel() == Level.HIGH){
			System.out.println("Supervisor handled issue " + issue.getIssueId());
			issue.setStatus(Status.RESOLVED); 
			issue.setHandledBy(this);

		}
		else{
			nextEmployee.handleRequest(issue);
		}
		
	}

}
