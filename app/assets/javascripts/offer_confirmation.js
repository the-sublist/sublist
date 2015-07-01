$(document).ready(function() {
  // $("input[data-available='false']").prop("disabled", true);

  $("#offer-button").on("click", function(event) {
    event.preventDefault();
    var teacherID = $('input[name=offer-position]:checked').attr("data-teacher-id")
    var offerID = $('input[name=offer-position]:checked').attr("data-offer-id")

    $.ajax({
      url: "/offers",
      type: "POST",
      data: {
        offer: {
          id: offerID,
          teacherID: teacherID
        }
      }
    }).done(function() {
      window.location.reload();
    }).error(function() {
      alert("There was an error. Please refresh and try again.");
    });

  });

});
