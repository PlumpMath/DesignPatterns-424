package com.ucd.interior.shop.customer.service;

public class Owner extends CustomerService{
	
	@Override
	public void handleRequest(Issue issue) {
		if(issue.getLevel() == Level.SEVERE){
			System.out.println("Owner handled issue " + issue.getIssueId());
			issue.setStatus(Status.RESOLVED); 
			issue.setHandledBy(this);

		}
		else{
			throw new RuntimeException("Something went wrong.Owner should get only severe issues!!!");
		}
		
	}

}
