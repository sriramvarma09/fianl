package models;

public class Transaction {
	
	private long transactionId;
	private long accountNumber;
	private String transactionType;
	private double transactionAmount;
	private String transactionMode;
	public Transaction() {}
	public Transaction(long transactionId, long accountNumber, String transactionType, double transactionAmount,
			String transactionMode) {
		super();
		this.transactionId = transactionId;
		this.accountNumber = accountNumber;
		this.transactionType = transactionType;
		this.transactionAmount = transactionAmount;
		this.transactionMode = transactionMode;
	}
	
	//getters and setters
	public long getTransactionId() {
		return transactionId;
	}
	
	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}
	
	public long getAccountNumber() {
		return accountNumber;
	}
	
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	public String getTransactionType() {
		return transactionType;
	}
	
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	
	public double getTransactionAmount() {
		return transactionAmount;
	}
	
	public void setTransactionAmount(double transactionAmount) {
		this.transactionAmount = transactionAmount;
	}
	
	public String getTransactionMode() {
		return transactionMode;
	}
	
	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}
	
	//toString
	
	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", accountNumber=" + accountNumber + ", transactionType="
				+ transactionType + ", transactionAmount=" + transactionAmount + ", transactionMode=" + transactionMode
				+ "]";
	}
	

}
