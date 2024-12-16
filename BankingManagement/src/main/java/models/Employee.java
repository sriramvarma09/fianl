package models;

public class Employee {
	
	
	
	private long employeeId;
	private String employeeFirstName;
	private String employeeLastName;
	private String employeeEmail;
	private String employeePassword;
	private String employeePhone;
	private String employeeAddress;
	
	public Employee(long employeeId, String employeeFirstName, String employeeLastName, String employeeEmail,
			String employeePassword, String employeePhone, String employeeAddress) {
		super();
		this.employeeId = employeeId;
		this.employeeFirstName = employeeFirstName;
		this.employeeLastName = employeeLastName;
		this.employeeEmail = employeeEmail;
		this.employeePassword = employeePassword;
		this.employeePhone = employeePhone;
		this.employeeAddress = employeeAddress;
	}
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	//getters and setters
	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getEmployeeFirstName() {
		return employeeFirstName;
	}
	
	public void setEmployeeFirstName(String employeeFirstName) {
		this.employeeFirstName = employeeFirstName;
	}
	
	public String getEmployeeLastName() {
		return employeeLastName;
	}
	
	public void setEmployeeLastName(String employeeLastName) {
		this.employeeLastName = employeeLastName;
	}
	
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	
	public String getEmployeePassword() {
		return employeePassword;
	}
	
	public void setEmployeePassword(String employeePassword) {
		this.employeePassword = employeePassword;
	}
	
	public String getEmployeePhone() {
		return employeePhone;
	}
	
	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}
	
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	
	//toString
	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeFirstName=" + employeeFirstName + ", employeeLastName="
				+ employeeLastName + ", employeeEmail=" + employeeEmail + ", employeePassword=" + employeePassword
				+ ", employeePhone=" + employeePhone + ", employeeAddress=" + employeeAddress + "]";
	}
	

	
}
