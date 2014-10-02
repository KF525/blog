//first line says that when document is finished loading,
//then evaluate our javascript
//all the functions are wrapped inside this initial function

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

  $(document).keydown(function(e) {
    if(e.which == 67 && e.ctrlKey) {
        alert("Can't stop. Won't stop.");
    }
  });
});
