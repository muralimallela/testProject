var textarea = document.getElementById("projectTitleInput");

textarea.addEventListener("input", function () {
    var input = this.value;
    var capitalized = input.replace(/\b\w/g, function (match) {
        return match.toUpperCase();
    });

    this.value = capitalized;

    this.style.height = "auto";
    this.style.height = (this.scrollHeight) + "px";
});
textarea.dispatchEvent(new Event("input"));

// Academic Year

var academicYearInput = document.getElementById("academicYearInput");

academicYearInput.addEventListener("input", function () {
    var input = this.value;
    var formattedYear = formatAcademicYear(input);

    // Check if the formatted year is different from the input and not just "-"
    if (formattedYear !== input && input !== "-") {
        this.value = formattedYear;
    }
});

clearInput.addEventListener("click", function () {
    academicYearInput.value = "";
});

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
// Trigger the input event initially to format the academic year
academicYearInput.dispatchEvent(new Event("input"));