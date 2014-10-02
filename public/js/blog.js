$(document).ready(function() {

  $(".table-toggle").click(function () {
    $(this).text(function(i, text) {
      return text === "Show Table" ? "Hide Table" : "Show Table";
    });
  });

  $(".table-toggle").click(function() {
    $(".table").toggle();
  });

  $(".laptop_toggle").click(function() {
    $(this).find('img').toggle();
  });
});
