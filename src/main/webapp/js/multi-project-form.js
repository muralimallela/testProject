/**
 * 
 */
/*
$(document).ready(function() {
	$("#addProject").click(function() {
		// Clone the project fields and add them to the form
		var clonedFields = $("#projectFields").clone();
		clonedFields.find("textarea[name='projectTitle']").val("");
		clonedFields.find("input[name='batchID']").val("");
		$("#projectFields").after(clonedFields);
	});
});
*/

$(document).ready(function() {
	$("#addProject").click(function() {
		// Clone the project fields and add them to the form
		var clonedFields = $("#projectFields").clone();
		clonedFields.find("textarea[name='projectTitle']").val("");
		clonedFields.find("input[name='batchID']").val("");
		$("#projectFields").after(clonedFields);
	});
});

function removeProject(button) {
	$(button).closest('.row').remove();
}