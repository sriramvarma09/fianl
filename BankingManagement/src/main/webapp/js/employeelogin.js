

function initializeEmployeeAuth() {
  const authTabs = document.querySelectorAll('.auth-tab');
  const authForms = document.querySelectorAll('.auth-form');
  const loginForm = document.getElementById('loginForm');
  const registerForm = document.getElementById('registerForm');

  // Tab switching functionality
  authTabs.forEach(tab => {
    tab.addEventListener('click', () => {
      const targetTab = tab.dataset.tab;
      authTabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
      authForms.forEach(form => {
        form.classList.remove('active');
        if (form.id === `${targetTab}Form`) {
          form.classList.add('active');
        }
      });
    });
  });

  // Real-time validation for registration form
  const inputs = {
    firstName: document.getElementById('firstName'),
    lastName: document.getElementById('lastName'),
    email: document.getElementById('email'),
    phone: document.getElementById('phone'),
    password: document.getElementById('registerPassword'),
    confirmPassword: document.getElementById('confirmPassword'),
    address: document.getElementById('address')
  };

  // Add input validation listeners
  inputs.firstName.addEventListener('input', () => {
    clearError(inputs.firstName);
    const result = validators.name(inputs.firstName.value);
    if (!result.valid) showError(inputs.firstName, result.error);
  });

  inputs.lastName.addEventListener('input', () => {
    clearError(inputs.lastName);
    const result = validators.name(inputs.lastName.value);
    if (!result.valid) showError(inputs.lastName, result.error);
  });

  inputs.email.addEventListener('input', () => {
    clearError(inputs.email);
    const result = validators.email(inputs.email.value);
    if (!result.valid) showError(inputs.email, result.error);
  });

  inputs.phone.addEventListener('input', () => {
    clearError(inputs.phone);
    const result = validators.phone(inputs.phone.value);
    if (!result.valid) showError(inputs.phone, result.error);
  });

  inputs.password.addEventListener('input', () => {
    clearError(inputs.password);
    const result = validators.password(inputs.password.value);
    if (!result.valid) showError(inputs.password, result.error);
  });

 
  // Handle registration form submission


  // Handle employee login form
  const employeeLoginInputs = {
    employeeId: document.getElementById('employeeId'),
    password: document.getElementById('loginPassword')
  };

  employeeLoginInputs.employeeId.addEventListener('input', () => {
    clearError(employeeLoginInputs.employeeId);
    const result = validators.employeeId(employeeLoginInputs.employeeId.value);
    if (!result.valid) showError(employeeLoginInputs.employeeId, result.error);
  });

  employeeLoginInputs.password.addEventListener('input', () => {
    clearError(employeeLoginInputs.password);
    const result = validators.password(employeeLoginInputs.password.value);
    if (!result.valid) showError(employeeLoginInputs.password, result.error);
  });

  loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    let isValid = true;

    // Validate employee ID
    const employeeIdResult = validators.employeeId(employeeLoginInputs.employeeId.value);
    if (!employeeIdResult.valid) {
      showError(employeeLoginInputs.employeeId, employeeIdResult.error);
      isValid = false;
    }

    // Validate password
    const passwordResult = validators.password(employeeLoginInputs.password.value);
    if (!passwordResult.valid) {
      showError(employeeLoginInputs.password, passwordResult.error);
      isValid = false;
    }
//ajax call to validate login
    if (isValid) {
      console.log('Employee login validation passed:', {
        employeeId: employeeLoginInputs.employeeId.value,
        password: employeeLoginInputs.password.value
      });
    }
  });
}


// Regular expressions for validation
const VALIDATION_PATTERNS = {
  name: /^[a-zA-Z\s]{2,50}$/,
  email: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
  phone: /^[0-9]{10}$/,
  password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
  employeeId: /^[0-9]{7}$/
};

// Error messages for validation failures
const ERROR_MESSAGES = {
  name: 'Name should contain only letters and spaces (2-50 characters)',
  email: 'Please enter a valid email address',
  phone: 'Phone number should be 10 digits',
  password: 'Password must be at least 8 characters and include uppercase, lowercase, number and special character',
  employeeId: 'Employee ID should be 7 digits',
  passwordMatch: 'Passwords do not match',
  required: 'This field is required'
};

// Validation functions
const validators = {
  required: (value) => {
    return value.trim() !== '' ? { valid: true } : { valid: false, error: ERROR_MESSAGES.required };
  },

  name: (value) => {
    return VALIDATION_PATTERNS.name.test(value) 
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.name };
  },

  email: (value) => {
    return VALIDATION_PATTERNS.email.test(value)
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.email };
  },

  phone: (value) => {
    return VALIDATION_PATTERNS.phone.test(value)
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.phone };
  },

  password: (value) => {
    return VALIDATION_PATTERNS.password.test(value)
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.password };
  },

  employeeId: (value) => {
    return VALIDATION_PATTERNS.employeeId.test(value)
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.employeeId };
  },

  confirmPassword: (password, confirmPassword) => {
    return password === confirmPassword
      ? { valid: true }
      : { valid: false, error: ERROR_MESSAGES.passwordMatch };
  },
  email: (value) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return {
      valid: emailRegex.test(value),
      error: 'Please enter a valid email address'
    };
  },
  
  contactNumber: (value) => {
    const phoneRegex = /^[0-9]{10}$/;
    return {
      valid: phoneRegex.test(value),
      error: 'Contact number must be 10 digits'
    };
  },
  
  aadharNumber: (value) => {
    const aadharRegex = /^[1-9]{12}$/;
    return {
      valid: aadharRegex.test(value),
      error: 'Aadhar number must be 12 digits'
    };
  },
  
  panNumber: (value) => {
    const panRegex = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
    return {
      valid: panRegex.test(value),
      error: 'Invalid PAN number format'
    };
  },
  
  
  initialDeposit: (value) => {
    const numValue = parseFloat(value);
    return {
      valid: !isNaN(numValue) && numValue >= 1000,
      error: 'Initial deposit must be at least ₹1,000'
    };
  }
  
};

// New specific validators for customer registration


// Helper function to show validation error
function showError(input, message) {
  const formGroup = input.closest('.form-group');
  const existingError = formGroup.querySelector('.error-message');
  
  if (existingError) {
    existingError.textContent = message;
  } else {
    const errorDiv = document.createElement('div');
    errorDiv.className = 'error-message';
    errorDiv.textContent = message;
    formGroup.appendChild(errorDiv);
  }
  
  input.classList.add('error');
}

// Helper function to clear validation error
function clearError(input) {
  const formGroup = input.closest('.form-group');
  const errorDiv = formGroup.querySelector('.error-message');
  if (errorDiv) {
    errorDiv.remove();
  }
  input.classList.remove('error');
}
// Helper function to initialize navigation bar
function initializeNavigation() {
  const nav = document.querySelector('nav');
  

  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      nav.classList.add('nav-scrolled');
    } else {
      nav.classList.remove('nav-scrolled');
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initializeNavigation();
  initializeEmployeeAuth();
});