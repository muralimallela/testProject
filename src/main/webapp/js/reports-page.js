/**
 * Dynamic rowspan
 */
$(function() {
	
	function groupTable($rows, startIndex, total, columnIndex) {
		if (total === 0) {
			return;
		}
		var i, currentIndex = startIndex, count = 1, lst = [];
		var tds = $rows.find('td:eq(' + (currentIndex + columnIndex)
			+ ')');
		var ctrl = $(tds[0]);
		lst.push($rows[0]);
		for (i = 1; i <= tds.length; i++) {
			if (ctrl.text() == $(tds[i]).text()) {
				count++;
				$(tds[i]).addClass('deleted');
				lst.push($rows[i]);
			} else {
				if (count > 1) {
					ctrl.attr('rowspan', count);
					groupTable($(lst), startIndex + 1, total - 1,
						columnIndex);
				}
				count = 1;
				lst = [];
				ctrl = $(tds[i]);
				lst.push($rows[i]);
			}
		}
	}

	// Call the  groupTable function on the table rows for different columns
	groupTable($('#dataTable tr:has(td)'), 0, 3, 0); // Group based on column 1
	groupTable($('#dataTable tr:has(td)'), 0, 3, 2); // Group based on column 3
	groupTable($('#dataTable tr:has(td)'), 0, 3, 3); // Group based on column 4

	// Remove the rows with the 'deleted' class
	$('#dataTable .deleted').remove();
});