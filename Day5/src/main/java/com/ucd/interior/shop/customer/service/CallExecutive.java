package com.ucd.interior.shop.customer.service;

public class CallExecutive extends CustomerService {

	@Override
	public void handleRequest(Issue issue) {
		if(issue.getLevel() == Level.LOW){
			System.out.println("Call executive handled issue " + issue.getIssueId());
			issue.setStatus(Status.RESOLVED); 
			issue.setHandledBy(this);
		}
		else{
			nextEmployee.handleRequest(issue);
		}
		
	}

}
