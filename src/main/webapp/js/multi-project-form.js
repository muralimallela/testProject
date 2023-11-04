/**
 * 
 */

// JavaScript for capitalizing the first letter of project titles and adjusting textarea height
document.addEventListener("input", function(event) {
	if (event.target.classList.contains("projectTitleInput")) {
		var textarea = event.target;
		var input = textarea.value;
		var capitalized = input.replace(/\b\w/g, function(match) {
			return match.toUpperCase();
		});

		textarea.value = capitalized;
		textarea.style.height = "auto";
		textarea.style.height = (textarea.scrollHeight) + "px";
	}
});

// JavaScript for formatting academic year
var academicYearInputs = document
	.querySelectorAll(".academicYearInput");
academicYearInputs.forEach(function(academicYearInput) {
	academicYearInput.addEventListener("input", function() {
		var input = this.value;
		var formattedYear = formatAcademicYear(input);

		// Check if the formatted year is different from the input and not just "-"
		if (formattedYear !== input && input !== "-") {
			this.value = formattedYear;
		}
	});
});

/*var clearInput = document.querySelector("#clearInput");
clearInput.addEventListener("click", function() {
	academicYearInputs.forEach(function(academicYearInput) {
		academicYearInput.value = "";
	});
});*/

function formatAcademicYear(input) {
	if (input.match(/^\d{4}$/)) {
		var lastTwoDigits = input.slice(-2);
		var nextYearLastTwoDigits = (parseInt(lastTwoDigits) + 1) % 100;
		nextYearLastTwoDigits = nextYearLastTwoDigits.toString()
			.padStart(2, '0');
		return input + "-" + nextYearLastTwoDigits;
	} else {
		return input;
	}
}

// JavaScript for cloning project fields
$(document).ready(function() {
	// Attach the click event handler to the parent element
	$(".container1").on("click", "#addProject", function() {
		// Clone the project fields and add them to the form
		var clonedFields = $(".projectFields").first().clone();
		clonedFields.find("input, textarea, select").each(function() {
			$(this).val(""); // Clear the value of each input element
		});
		$(".projectFields").last().after(clonedFields);
	});
});

// Use event delegation for the removeProject function
$(document).on("click", ".btn-danger", function() {
	$(this).closest('.row').remove();
});