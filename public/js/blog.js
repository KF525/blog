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

  $(document).keypress(function(event) {

     var keycode = (event.keyCode ? event.keyCode : event.which);

     if(keycode == 38, 38, 40, 40, 37, 39, 37, 39, 65, 66){
       alert("Hello");
     }
   });
});
