/**
 * Accdemic year Generator js 
 */
// Function to generate academic years dynamically
function generateAcademicYears(startYear, endYear) {
	const academicYears = [];
	for (let year = endYear; year >= startYear; year--) {
		const academicYear = year + "-" + (year + 1).toString().substring(2);
		academicYears.push(academicYear);
	}
	return academicYears;
}


// Define the start and end years
const startYear = 2000;
const endYear = new Date().getFullYear();

// Generate academic years
const academicYears = generateAcademicYears(startYear, endYear);

// Populate the select element with option tags
const academicYearSelect = document.getElementById('academic-year-select');
academicYears.forEach(year => {
	const option = document.createElement('option');
	option.value = year;
	option.text = year;
	academicYearSelect.appendChild(option);
});