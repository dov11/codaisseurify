function createSong(name, release_date, duration) {
  let newSong = { name: name, release_date: release_date, length: duration };
  let path = window.location.pathname

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

    let songId = data.song.id;
    let songlink = path + '/songs/' + songId;

    let anchor = $('<a></a>')
    .attr('id', songId)
    .attr('href', songlink)
    .html(name);

    let well = $('<p class="well"></p>')
    .attr('id', 'well-' + songId)
    .append(anchor)
    $("#songsList").append(well);
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
  .html(message);

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

function deleteSong() {
  event.preventDefault();
  let path = window.location.pathname
  let songId = $(this).attr('id')
  $.ajax({
    type: "DELETE",
    url: path + "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})
    .done(function(data) {
      console.log(data)
      $("#well-"+songId).remove()
    });
}

// function initiateDeleteSong() {
//   let songId = $(this).attr('id');
//   deleteSong(songId);
// }

$(document).ready(function() {
  $("#button-save").attr('data-disable-with', "Save")
  $("#new_song").on('submit', submitSong);
  $("#delete-song").children().on('click', deleteSong);
});
