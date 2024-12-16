window.onload = function() {
    
    
    if (sessionStorage.getItem('customerLoggedIn')) {
        window.location.replace('customerhome.jsp');
    }
	if (sessionStorage.getItem('employeeLoggedIn')) {
		window.location.replace('employeehome.jsp');
	}

    // Attach an event listener to the login form's submit event
    const loginForm = document.querySelector('.login-form');

    if (loginForm) {
        // Add validation message under the username box
        const usernameField = document.getElementById('username');
        const usernameMessage = document.createElement('div');
        usernameMessage.id = 'usernameMessage';
        usernameMessage.style.color = 'red';
        usernameMessage.style.fontSize = '12px';
        usernameMessage.style.marginTop = '5px';
        usernameMessage.textContent = 'Username must be exactly 7 digits.';
        usernameField.parentNode.insertBefore(usernameMessage, usernameField.nextSibling);
        usernameMessage.style.display = 'none'; // Initially hidden

        loginForm.addEventListener('submit',function (event) {
            event.preventDefault(); // Prevent the default form submission

            // Get the username value
            const username = document.getElementById('username').value;

            // Validate that the username contains exactly 7 numbers
            const usernamePattern = /^\d{7}$/;

            if (!usernamePattern.test(username)) {
                usernameMessage.style.display = 'block'; // Show validation message
                return;
            } else {
                usernameMessage.style.display = 'none'; // Hide validation message
            }


            const password = document.getElementById('password').value;
			if (!username || !password) {
    				alert('Both username and password are required!');
    				return;
				}
			else{
            $.ajax({
                url: "http://localhost:8080/BankingManagement/LoginServlet",
                method: 'Post',
                data:{username:username,password:password,role:'customer'},
                success: function(response) {
					console.log(response);
					console.log(typeof(response));
					result=JSON.parse(response);
					console.log(result);
					console.log(typeof(result));
					result=JSON.parse(result);
					console.log(result);
					console.log(typeof(result));
                    if (result.success) {
                        showPopup('Login Successful', 'Welcome to your account!');
                        sessionStorage.setItem('customerLoggedIn', 'true');
                        sessionStorage.setItem('customerId', result.customerId);
                        sessionStorage.setItem('customerName', result.customerName);
                        setTimeout(() => {
                            window.location.href = 'customerhome.jsp';
                        }, 2000);
                    } else {
                        alert('Login failed: ' + response.message);
                    }
                },
                error: function() {
                    alert('An error occurred. Please try again later.');
                }
            });

        }
        });
    }
};

// Function to show a popup with a custom message
function showPopup(title, message) {
    // Create a popup container
    const popup = document.createElement('div');
    popup.style.position = 'fixed';
    popup.style.top = '50%';
    popup.style.left = '50%';
    popup.style.transform = 'translate(-50%, -50%)';
    popup.style.backgroundColor = '#fff';
    popup.style.padding = '20px';
    popup.style.boxShadow = '0 0 10px rgba(0, 0, 0, 0.2)';
    popup.style.zIndex = '1000';

    // Add title and message
    popup.innerHTML = `<h2>${title}</h2><p>${message}</p>`;

    // Append popup to the body
    document.body.appendChild(popup);

    // Remove the popup after 2 seconds
    setTimeout(() => {
        popup.remove();
    }, 2000);
}
