package models;

public class Customer {
	
	private long customerSSNId;
	private String customerName;
	private String customerEmail;
	private String customerPassword;
	private String customerPhone;
	private String customerAddress;
	private long customerAadharNumber;
	private String customerPanNumber;
	
	public Customer() {}
	
	public Customer(long customerSSNId, String customerName, String customerEmail, String customerPassword,
			String customerPhone, String customerAddress, long customerAadharNumber, String customerPanNumber) {
		super();
		this.customerSSNId = customerSSNId;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerPassword = customerPassword;
		this.customerPhone = customerPhone;
		this.customerAddress = customerAddress;
		this.customerAadharNumber = customerAadharNumber;
		this.customerPanNumber = customerPanNumber;
	}

	public long getCustomerSSNId() {
		return customerSSNId;
	}

	public void setCustomerSSNId(long customerSSNId) {
		this.customerSSNId = customerSSNId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public long getCustomerAadharNumber() {
		return customerAadharNumber;
	}

	public void setCustomerAadharNumber(long customerAadharNumber) {
		this.customerAadharNumber = customerAadharNumber;
	}

	public String getCustomerPanNumber() {
		return customerPanNumber;
	}

	public void setCustomerPanNumber(String customerPanNumber) {
		this.customerPanNumber = customerPanNumber;
	}
	
	//toString
	@Override
	public String toString() {
		return "Customer [customerSSNId=" + customerSSNId + ", customerName=" + customerName + ", customerEmail="
				+ customerEmail + ", customerPassword=" + customerPassword + ", customerPhone=" + customerPhone
				+ ", customerAddress=" + customerAddress + ", customerAadharNumber=" + customerAadharNumber
				+ ", customerPanNumber=" + customerPanNumber + "]";
	}
	
	

}
