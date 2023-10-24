/**
 * Search over a pages (Tables)
 */

document.addEventListener("DOMContentLoaded", function() {
	const searchInput = document.getElementById("searchInput");
	const dataTable = document.getElementById("dataTable").getElementsByTagName("tbody")[0];

	searchInput.addEventListener("input", function() {
		const searchText = searchInput.value.toLowerCase();
		const rows = dataTable.getElementsByTagName("tr");

		for (const row of rows) {
			const rowData = row.textContent.toLowerCase();
			row.style.display = rowData.includes(searchText) ? "" : "none";
		}
	});
});
