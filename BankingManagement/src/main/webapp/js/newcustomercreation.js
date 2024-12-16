/**
 * 
 */
function registerCustomer(event){
	event.preventDefault();
	var form = event.target;
	var data = getFormData(form);
	console.log(data);
	$.ajax({
		url: 'http://localhost:8080/BankingManagement/customerRegister',
		type: 'POST',
		data: data,
		success: function(data) {
			console.log(data);
			alert(data);
			window.location.href = 'employeehome.jsp';
		},
		error: function(xhr, status, error) {
			console.log(xhr.responseText);
			alert('Error: ' + xhr.responseText);
		}
	});
	
	
	
	
	
}
function registerCustomerexist(event){
	event.preventDefault();
	var form = event.target;
	var data = getFormData(form);
	console.log(data);
	$.ajax({
		url: 'http://localhost:8080/BankingManagement/customerRegisterExist',
		type: 'POST',
		data: data,
		success: function(data) {
			console.log(data);
			alert(data);
			window.location.href = 'employeehome.jsp';
		},
		error: function(xhr, status, error) {
			console.log(xhr.responseText);
			alert('Error: ' + xhr.responseText);
		}
	});
}

function getFormData(form) {
    var formData = new FormData(form); // Create a FormData object from the form
    var data = {}; // Initialize an empty object to hold the form data
    formData.forEach((value, key) => {
        data[key] = value; // Populate the object with key-value pairs
    });
    return data;
}