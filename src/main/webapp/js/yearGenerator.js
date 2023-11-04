/**
 * Select tag year Generator
 */
// Get the select element
var yearSelect = document.getElementById("yearSelect");

// Get the current year
var currentYear = new Date().getFullYear();

// Set a range of years you want in the select element (e.g., 10 years in the past and 10 years in the future)
var startYear = 2000;
var endYear = currentYear ;

// Create and append the options to the select element
for (var year = currentYear+2; year >= startYear; year--) {
	var option = document.createElement("option");
	option.value = year;
	option.text = year;
	yearSelect.appendChild(option);
}

/*Set the default selected year (optional)
var defaultYear = currentYear;
yearSelect.value = defaultYear;*/