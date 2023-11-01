/**
 * dataTables
 * 
 * <link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.css" />
 * 
 * <script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.25/datatables.min.js"></script>
 */
$(document).ready(function() {
    $("#dataTable").DataTable({
        columnDefs: [
            {
                targets: [-1], // Target the last column
                orderable: false, // Make it non-sortable
            }
        ]
    });
});
