<%@ page language="java" import="java.util.*, models.Account" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Accounts</title>
    <link rel="stylesheet" href="css/navigation.css" />
    <link rel="stylesheet" href="css/employee.css" />
    <script src="js/customerhome.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" 
        crossorigin="anonymous"></script>
    <link href="css/newcustomercreation.css" rel="stylesheet" media="all">
    <!-- Include Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
 <nav>
        <div class="nav-content">
            <div class="logo">ABC Bank</div>
            <div class="nav-links">
                <a href="employeehome.jsp">Home</a>
                <a href="employeehome.jsp#services">Services</a>
                <a href="employeeprofile.jsp">Profile</a>
                <a id="logout-link" onClick="logout()">Logout</a>
            </div>
        </div>
    </nav>

    <div class="formbold-main-wrapper">
        <div class="formbold-form-wrapper">
            <form onSubmit="event.preventDefault(); setArrayList();" method="POST">
                <div class="formbold-form-title">
                    <h2>View Accounts of A Customer</h2>
                </div>
                <div class="formbold-input-flex">
                    <div>
                        <label for="ssnid" class="formbold-form-label">SSNId</label>
                        <input type="text" name="ssnid" id="ssnid" class="formbold-form-input" />
                    </div>
                </div>
                <input type="submit" class="formbold-btn"  value="Populate">
            </form>
        </div>

        <!-- Container for dynamically loaded accounts -->
        <div class="bg-white shadow-sm rounded p-4 mb-4" id="accountContainer">
            <h3 class="text-5 fw-400 mb-4">Bank Accounts</h3>
            <hr class="mb-4 mx-n4">
            <!-- Dynamic content will be loaded here -->
        </div>
    </div>

    <script>
    function setArrayList() {
        var ssnid = document.getElementById("ssnid").value;
        $.ajax({
            url: "viewAccounts", // Adjust this URL based on the servlet mapping
            type: "POST",
            data: { ssnid: ssnid },
            success: function(data) {
                // Ensure data is a valid array before using forEach
                try {
                    let accountList = JSON.parse(data); // Parse response if it's a string
                    if (Array.isArray(accountList)) {
                        console.log(accountList);
                        
                        // Clear previous account cards
                        let accountContainer = document.getElementById("accountContainer");
                        accountContainer.innerHTML = ''; // Reset the container before appending new items

                        // Iterate over accountList and create elements
                        accountList.forEach(account => {
                            console.log(account.accountNumber);
                            console.log(account.accountStatus);
                            console.log(typeof(account.accountStatus));
                            
                            // Create the main account card div
                            let accountCard = document.createElement('div');
                            accountCard.classList.add('account-card', 'account-card-primary', 'text-white', 'rounded');
                            
                            // Create the inner div for account information
                            let innerDiv = document.createElement('div');
                            innerDiv.classList.add('py-4', 'my-2', 'ps-4');
                            
                            // Create the account name and append to inner div
                            let accountName = document.createElement('p');
                            accountName.classList.add('text-4', 'fw-500', 'mb-1');
                            accountName.textContent = "ABC Bank"; // Static name for now

                            // Create the account number and append to inner div
                            let accountNumber = document.createElement('p');
                            accountNumber.classList.add('text-4', 'opacity-9', 'mb-1');
                            accountNumber.textContent = account.accountNumber;

                            // Create the account status and append to inner div
                            let accountStatus = document.createElement('p');
                            accountStatus.classList.add('m-0');
                            let status = '';
                            if (account.accountStatus) {
                            	accountStatus.innerHTML = `Active <span class="text-3"><i class="fas fa-check-circle"></i></span>`
                            } else {
                            	accountStatus.innerHTML = `Inactive <span class="text-3"><i class="fas fa-check-circle"></i></span>`
                            }
                            console.log(status);
                            //accountStatus.innerHTML = `${status} <span class="text-3"><i class="fas fa-check-circle"></i></span>`;
                            // Append all child elements to the inner div
                            innerDiv.appendChild(accountName);
                            innerDiv.appendChild(accountNumber);
                            innerDiv.appendChild(accountStatus);

                            // Append inner div to account card
                            accountCard.appendChild(innerDiv);

                            // Append the account card to the container
                            accountContainer.appendChild(accountCard);
                        });
                    } else {
                        console.error("Expected an array but got:", accountList);
                        alert("Unexpected response format.");
                    }
                } catch (e) {
                    console.error("Error parsing response as JSON:", e);
                    alert("Error fetching account data.");
                }
            },
            error: function() {
                alert("Error fetching account data.");
            }
        });
    }
    </script>
</body>
</html>
