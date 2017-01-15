package com.ucd.interior.shop.customer.service;

public class Issue {

	public Issue(Long invoiceId , Level level , String description){
		this.invoiceId = invoiceId;
		this.level = level;
		this.description = description;
		this.issueId = System.currentTimeMillis();
		
	}
	
	private Long issueId;
	private Long invoiceId;
	private Status status = Status.UNRESOLVED;
	private Level level;
	private String description;
	private CustomerService handledBy;
	
	public Long getIssueId() {
		return issueId;
	}
	
	public Long getInvoiceId() {
		return invoiceId;
	}
	
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public Level getLevel() {
		return level;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void setHandledBy(CustomerService handledBy) {
		this.handledBy = handledBy;
	}
	
	public CustomerService getHandledBy() {
		return handledBy;
	}
	
}
