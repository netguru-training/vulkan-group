$ ->
  $("#plus").on "ajax:success", (e, data, status, xhr) ->
    currentValue = $("#value").text();
    newValue = +currentValue + 1;
    $("#value").text(newValue);
  $("#minus").on "ajax:success", (e, data, status, xhr) ->
    currentValue = $("#value").text();
    newValue = +currentValue - 1;
    $("#value").text(newValue);
