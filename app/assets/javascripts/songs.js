function createSong(name) {
  var newSong = { name: name};
  var path = window.location.pathname

  $.ajax({
    type: "POST",
    url: "" + path + "/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);

    var songId = data.id;

    var anchor = $('<a></a>')
      .attr('id', songId)
      .html(name);

    $("#songsList").append(anchor);
  })

  .fail(function(error) {
    console.log(error)
    error_message = error.responseJSON.title[0];
    showError(error_message);
  });
}

function showError(message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(message);

  $("#formgroup-title")
    .addClass("has-error")
    .append(errorHelpBlock);
}

function submitSong(event) {
  event.preventDefault();
  //  resetErrors();
  //  need to add slectors id for date and length
  createSong($("#song_name").val());
  $("#song_name").val(null);
}

$(document).ready(function() {
  $("#new_song").bind('submit', submitSong);
});
