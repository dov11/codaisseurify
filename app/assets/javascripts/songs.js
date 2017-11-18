function createSong(name, release_date, duration) {
  var newSong = { name: name, release_date: release_date, length: duration };
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
    error_message = "Name " + error.responseJSON.name[0];
    resetErrors();
    showError(error_message);
  });
}

function showError(message) {
  let errorHelpBlock = $('<span class="help-block"></span>')
  .attr('id', 'error_message')
  .text(message);

  $("#formgroup-title")
  .addClass("has-error")
  .append(errorHelpBlock);
}

function resetErrors() {
  $("#formgroup-title").removeClass("has-error")
  $(".help-block").remove();
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  //  need to add slectors id for date and length
  // createSong($("#song_name").val());
  createSong(...getSongAttributes());
  $("#song_name").val(null);
  $("#song_length").val(1);
  $("#song_release_date_1i").val(new Date().getFullYear());
  $("#song_release_date_2i").val(new Date().getMonth());
  $("#button-save").removeAttr('data-disable-with');
}

function getSongAttributes() {
  let date = `${$("#song_release_date_1i").val()}-${$("#song_release_date_2i").val()}-01 00:00:00`
  return [$("#song_name").val(), date, $("#song_length").val()];
}

$(document).ready(function() {
  $("#button-save").attr('data-disable-with', "Save")
  $("#new_song").bind('submit', submitSong);
});
