function showreg(event){

  const regoption=document.getElementById("register-option");
  const login = document.getElementById("login");
  const register = document.getElementById("register");
  const logoption=document.getElementById("login-option");
  regoption.style.backgroundColor= "#223843";
  logoption.style.backgroundColor = "grey";
  login.classList = "hidden";
  register.classList = "visible";	
  
}


function showlogin(event){
  const regoption=document.getElementById("register-option");
  const logoption=document.getElementById("login-option");
  regoption.style.backgroundColor= "grey";
  logoption.style.backgroundColor = "#223843";
  login.classList = "visible";
  register.classList = "hidden";	
}




function registerEmployee(event){
event.preventDefault();
console.log(5);

const data = event.target;

let fname = data["firstName"].value;
let lname = data["lastName"].value;
let email = data["email"].value;
let password =  data["password"].value;
let confirm =  data["confirmPassword"].value;
let address =  data["address"].value;
let phone =  data["phone"].value;



const samepassword = (password,confirm) =>{
return password === confirm;
}
const validatePassword = (password) =>{
    var re = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return re.test(password);
}


//showEregisterPopup();
let result;
$.ajax({
	url:"EmployeeRegisterServlet",
	method:"POST",
	data:{"firstname":fname,"lastname":lname,"email":email,"password":password,"address":address,"contactNumber":phone},
	success:function(response){
		let res=JSON.parse(response);
		res=JSON.parse(res);
		console.log(res.valid);
		if(res.valid==true){
			showPopup('Registration Successful', 'Welcome to your account!');
			sessionStorage.setItem("Loggedin",true);
			sessionStorage.setItem("role","employee");
			sessionStorage.setItem("employee",JSON.stringify(res.employee));
			window.location.replace("employeehome.jsp");
			
		}else {
			alert("Registration failed");
			window.reload();
		}
		}

});


}



function Login(event){
	event.preventDefault();
	let employee = null;
	const data = event.target;
	let empid = data["employeeId"].value; 
	console.log(data["employeeId"].value);
	
$.ajax({
	url:"LoginServlet",
	method:"POST",
	data:{"username":empid,"password":data["loginPassword"].value,"role":"employee"},
	success:function(response){
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
                        sessionStorage.setItem('employeeLoggedIn', 'true');
                        sessionStorage.setItem('employeeId', result.employeeId);
                        sessionStorage.setItem('employeeName', result.employeeName);
                        setTimeout(() => {
                            window.location.href = 'employeehome.jsp';
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


function customerLogin(event){
	event.preventDefault();
	const data = event.target;
	let cid = data["username"].value;
	loginToCustomerServer(cid,data["password"].value);
	console.log(cid);
}














function registerCustomer(event) {

event.preventDefault();
const data = event.target;
    let cust_name = data['cust_name'].value;
    let cust_contact = data['cust_contact'].value;
    let cust_balance = data['cust_balance'].value;
    let cust_aadhaar = data['cust_aadhaar'].value;
    let cust_address = data['cust_address'].value;
    let cust_pan = data['cust_pan'].value;
    let cust_dob = data['cust_dob'].value;
    let cust_gender = data['cust_gender'].value;
    let cust_mar_status = data['cust_mar_status'].value;
    let cust_email = data['cust_email'].value;
const validateEmail = cust_email => {
  return (
      /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    ).test(cust_email);
};
const validateAadhar = cust_aadhaar => {
  return (
     /^\d{12}$/
    ).test(cust_aadhaar);
};
const validateContact = cust_contact => {
  return (
     /^\d{10}$/
    ).test(cust_contact);
};

const validatePan = cust_pan => {
  return (
     /[A-Z]{5}[0-9]{4}[A-Z]{1}$/
    ).test(cust_pan);
};
const ve = validateEmail(cust_email);
const vp = validatePan(cust_pan);
const va = validateAadhar(cust_aadhaar);
const vc = validateContact(cust_contact);


    let customer = {
        'name': cust_name, 
        'contact': cust_contact, 
        'balance': cust_balance, 
        'aadhaar': cust_aadhaar, 
        'address': cust_address, 
        'pan': cust_pan, 
        'dob': cust_dob, 
        'gender': cust_gender, 
        'mar_sta': cust_mar_status, 
        'email': cust_email 
    };

   customerDetailsToServer(customer); 	

   //showCreatedPopup(customer);
  
    
	
}
function customerDetailsToServer(customer){
	let result;
$.ajax({
	url:"https://examplelink.com",
	method:"POST",
	data:{Customer:JSON.stringify(customer)},
	success:function(response){
		if(response.valid){
			result=200;
//showEloginpopup();
		}
		else{
			result=404;
		}
	}
			
})

}

function resetit(e){
	e.reset();
}



function showCreatedPopup(event){
console.log("sampath");
		let popup = document.getElementById('ccreate-popup');
		let greet = document.createElement("h1");
		greet.textContent = "Congratulations! Customer Record Saved Sucessfully";
		let mess = document.createElement("p");
		let ssnid = event["ssnid"];
		mess.textContent = `Customer SSN Id : ${ssnid} saved Successfully`;
		let butt = document.createElement("button");
		butt.textContent = "OK";
		butt.addEventListener('click',() => closepop());
		let pop_content = document.createElement("div");
		pop_content.setAttribute('id','popup-content');
		popup.appendChild(pop_content);
		pop_content.appendChild(greet);
		pop_content.appendChild(mess);
		pop_content.appendChild(butt);
		document.getElementById('ccreate-popup').style.display = 'flex';
		return false;
	}
function closepop(){
		const popup = document.getElementById('ccreate-popup');
		const popup_content = document.getElementById('popup-content');
		popup.removeChild(popup_content);
		popup.style.display = 'none';
	
	}






function searchCustomer(event) {
    const ssnid = document.getElementById('search_ssnId').value;
    const customer = getCustomerData(ssnid) ///ajax method
    
    if (customer) {
        const customerData = JSON.parse(customer);
        
        document.getElementById('ssnId').value = ssnid;
        document.getElementById('accNo').value = customerData.acc;
        document.getElementById('ifsc').value = customerData.ifsc;
        document.getElementById('cust_name').value = customerData.name;
        document.getElementById('cust_contact').value = customerData.contact;
        document.getElementById('cust_balance').value = customerData.balance;
        document.getElementById('cust_aadhaar').value = customerData.aadhaar;
        document.getElementById('cust_pan').value = customerData.pan;
        document.getElementById('cust_dob').value = customerData.dob;
        document.getElementById('cust_gender').value = customerData.gender;
        document.getElementById('cust_mar_status').value = customerData.mar_sta;
        document.getElementById('cust_email').value = customerData.email;
        document.getElementById('cust_address').value = customerData.address;
        
        document.getElementById('customer-details').style.display = 'flex';
        
        document.getElementById('search_ssnId').disabled = true;
        document.querySelector('button[onclick="searchCustomer()"]').disabled = true;
    } else {
        alert('Customer not found');
        document.getElementById('customer-details').style.display = 'none';
    }
}



function editCustomer(event) {
  const data = event.target;
    const ssnId = data['ssnId'].value;
    
    
        const customer = {
            name: data['cust_name'].value,
            acc: data['accNo'].value,
            ifsc: data['ifsc'].value,
            contact: data['cust_contact'].value,
            balance: data['cust_balance'].value,
            aadhaar: data['cust_aadhaar'].value,
            address: data['cust_address'].value,
            pan: data['cust_pan'].value,
            dob: data['cust_dob'].value,
            gender: data['cust_gender'].value,
            mar_sta: data['cust_mar_status'].value,
            email: data['cust_email'].value
        };
        
       
      //updateEditToServer(customer); ajax method
    }

function resetSearch() {
    document.getElementById('search_ssnId').value = '';
    document.getElementById('search_ssnId').disabled = false;
    document.querySelector('button[onclick="searchCustomer()"]').disabled = false;
    document.getElementById('customer-details').style.display = 'none';
}
function deleteCustomer(event){
	const ssnId = document.getElementById('ssnId').value;
	//deleteCustomerRecord(ssnid);//ajaxcall
	 resetSearch();
}




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