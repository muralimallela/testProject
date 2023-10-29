/**
 * 
 */
// STUDENT ID 

let studentIDInput = document.getElementById("StudentID");
const paragraphElement = document.getElementById('myParagraph');
const numberErrorMsg = document.getElementById('numberErrorMsg');
const submitBtn = document.getElementById('submitBtn');
let subString = ["C51A", "C55A"];
const yearSelect = document.getElementById("yearSelect");
const branchField = document.getElementById("Department");
const batch = document.getElementById("Batch");


//Batch

batch.addEventListener("input", function() {
	batch.value = batch.value.toUpperCase();
});


studentIDInput.addEventListener("input", function() {
	const inputValue = studentIDInput.value.toUpperCase();
	submitBtn.disabled = true;

	// Year (Auto Complete)

	const firstTwoChars = inputValue.substring(0, 2);
	const year = "20" + (Number(firstTwoChars) + 4);
	yearSelect.value = year;

	// Department (Auto Complete)

	const branchValue = inputValue.substring(6, 8);
	const branch = (branchValue === "05") ? "CSE" : (branchValue === "02") ? "EEE" : (branchValue === "04") ? "ECE" : (branchValue === "66") ? "CSM" : (branchValue === "03") ? "MECH" : "";
	branchField.value = branch;

	if (inputValue.length < 10) {
		studentIDInput.value = inputValue;
		paragraphElement.textContent = '';

	} else {
		studentIDInput.value = inputValue.slice(0, 10);
		checkStudentID();

	}

});

function checkStudentID() {

	if (!subString.some(sub => studentIDInput.value.includes(sub))) {
		studentIDInput.focus();
		paragraphElement.textContent = 'Invalid student ID';
		submitBtn.disabled = true;
	} else {
		paragraphElement.textContent = '';
		submitBtn.disabled = false;
	}
	if (studentIDInput.value.length !== 10) {
		studentIDInput.focus();
		paragraphElement.textContent = "Student ID must be exactly 10 characters";
		submitBtn.disabled = true;
	}
}

// FIRST NAME AND LAST NAME

const firstNameInput = document.getElementById('FirstName');
const lastNameInput = document.getElementById('LastName');

function capitalizeFirstLetter(string) {
	return string.split(' ').map(word => {
		return word.charAt(0).toUpperCase() + word.slice(1);
	}).join(' ');
}

firstNameInput.addEventListener('input', function() {
	const currentValue = firstNameInput.value;
	const capitalizedValue = capitalizeFirstLetter(currentValue);
	firstNameInput.value = capitalizedValue;
});

lastNameInput.addEventListener('input', function() {
	const currentValue = lastNameInput.value;
	const capitalizedValue = capitalizeFirstLetter(currentValue);
	lastNameInput.value = capitalizedValue;
});

// PASSWORDS 


const passwordInput = document.getElementById("password");
const confirmPasswordInput = document.getElementById("confirmPassword");
const passwordMatchMessage = document
	.getElementById("passwordMatchMessage");

function checkPasswordMatch() {
	const password = passwordInput.value;
	const confirmPassword = confirmPasswordInput.value;

	if (password.length <= confirmPassword.length) {
		if (password === confirmPassword) {
			passwordMatchMessage.textContent = "";
			confirmPasswordInput.setCustomValidity("");
			submitBtn.disabled = false;
		} else {
			passwordMatchMessage.textContent = "Passwords are not match";
			confirmPasswordInput
				.setCustomValidity("Passwords are not match");
			submitBtn.disabled = true;
		}
	}
}

// YEAR 




//Department

// CONTACT NUMBER

const contactNumberInput = document.getElementById("ContactNumber");

contactNumberInput.addEventListener("input", function() {
	const inputValue = contactNumberInput.value;
	if (inputValue.length <= 10) {
		contactNumberInput.value = inputValue;
		numberErrorMsg.textContent = "";
		submitBtn.disabled = false;
	} else {
		contactNumberInput.value = inputValue.slice(0, 10);
	}
});
contactNumberInput.addEventListener("blur", function() {
	if (contactNumberInput.value.length !== 10) {
		numberErrorMsg.textContent = "Contact number must be exactly 10 numbers";
		submitBtn.disabled = true;
	} else {
		numberErrorMsg.textContent = "";
		submitBtn.disabled = false;
	}
});