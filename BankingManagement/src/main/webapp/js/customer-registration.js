function RegisterCustomer(event){
	event.preventDefault();
	var form = document.getElementById("customerRegistrationForm");
	var formData = new FormData(form);
	var Customer = {};
	formData.forEach(function(value, key) {
		Customer[key] = value;
	});
	console.log(Customer);
	var json = JSON.stringify(Customer);
	$.ajax({
		url: 'http://localhost:8080/finalcheck/EmployeeServlet',
		type: 'POST',
		data: {customer:json},
		success: function(data) {
			alert("Register successfully!");
			window.location.href = "employeehome.jsp";
		},
		error: function(data) {
			alert("Register failed!");
		}
	});
	
	
	
	
	
}