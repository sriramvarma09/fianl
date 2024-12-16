function logout() {
            // Clear session storage
            console.log('Logging out');
            sessionStorage.clear();

            // Redirect to login page
            window.location.replace('index.html');
     }


        
        
function transferFunds(event){
	event.preventDefault();
	console.log('Transfer funds');
	// Get the data from the form
	var fromAccount = $('#fromAccount').val();
	var toAccount = $('#toAccount').val();
	var amount = $('#amount').val();
	
	$.ajax({
		url: 'http://localhost:8080/BankingManagement/transfer',
		type: 'POST',
		data: {
			customerId: sessionStorage.getItem('customerId'),
			fromAccount: fromAccount,
			toAccount: toAccount,
			amount: amount
		},
		success: function(data) {
			console.log(data);
			alert(data);
			window.location.replace('customerhome.jsp');
		},
		error: function(data) {
			console.log(data);
			alert('Transfer failed');
			window.location.replace('customerhome.jsp');
		}
	});
	
	
	
	
	
}
function transferFundsE(event){
	event.preventDefault();
	console.log('Transfer funds');
	// Get the data from the form
	var fromAccount = $('#fromAccount').val();
	var toAccount = $('#toAccount').val();
	var amount = $('#amount').val();
	var role="Employee";
	
	$.ajax({
		url: 'http://localhost:8080/BankingManagement/transfer',
		type: 'POST',
		data: {
			customerId: sessionStorage.getItem('customerId'),
			fromAccount: fromAccount,
			toAccount: toAccount,
			amount: amount
		},
		success: function(data) {
			console.log(data);
			alert(data);
			window.location.replace('customerhome.jsp');
		},
		error: function(data) {
			console.log(data);
			alert('Transfer failed');
			window.location.replace('customerhome.jsp');
		}
	});
	}