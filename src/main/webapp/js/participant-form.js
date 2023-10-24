$(document).ready(function () {
    $("#addStudent").click(function () {
        $("#studentInputs").append(`
            <div class="row mb-2">
                <div class="col">
                    <input type="text" class="form-control" name="studentID[]" placeholder="Student ID" required>
                </div>
            </div>
        `);

        $("#studentInputs .row:last-child").append(`
          <div class="col">
            <button type="button" class="btn btn-danger removeStudent small">Remove</button>
          </div>
        `);

        $(".removeStudent").click(function () {
            $(this).closest(".row").remove();
        });
    });
});