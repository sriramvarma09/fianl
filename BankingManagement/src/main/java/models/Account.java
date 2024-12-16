package models;

public class Account {
	
	private long accountNumber;
	private long customerSSNId;
	private double accountBalance;
	private String accountType;
	private boolean accountStatus;
	public Account() {}
	
	public Account(long accountNumber, long customerSSNId, double accountBalance, String accountType,
			boolean accountStatus) {
		super();
		this.accountNumber = accountNumber;
		this.customerSSNId = customerSSNId;
		this.accountBalance = accountBalance;
		this.accountType = accountType;
		this.accountStatus = accountStatus;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public long getCustomerSSNId() {
		return customerSSNId;
	}

	public void setCustomerSSNId(long customerSSNId) {
		this.customerSSNId = customerSSNId;
	}

	public double getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(double accountBalance) {
		this.accountBalance = accountBalance;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public boolean isAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(boolean accountStatus) {
		this.accountStatus = accountStatus;
	}
	
	//toString
	@Override
	public String toString() {
		return "Account [accountNumber=" + accountNumber + ", customerSSNId=" + customerSSNId + ", accountBalance="
				+ accountBalance + ", accountType=" + accountType + ", accountStatus=" + accountStatus + "]";
	}
	

}
