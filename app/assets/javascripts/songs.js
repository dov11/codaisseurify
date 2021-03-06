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
    let songName = data.song.name;
    let songLink = path + '/songs/' + songId;

    let anchor = $('<a></a>')
    .attr('id', 'link-to-' + songId)
    .attr('href', songLink)
    .html(name);

    let deleteButton = $('<a class="btn btn-danger btn-delete">Delete Song</a>')
    .attr('id', songId)
    .on('click', deleteSong);

    let deleteSpan = $('<span class="delete-song"></span>')
    .append(deleteButton)

    let editLink = path+'/songs/'+songId+'/edit'

    let editButton = $('<a class="btn btn-info"></a>')
    .attr('href', editLink)
    .html('Edit Song')

    let editSpan = $('<span></span>')
    .append(editButton)

    let well = $('<p class="well"></p>')
    .attr('id', 'well-' + songId)
    .append(anchor)
    .append(deleteSpan)
    .append(editSpan)

    $("#songsList").append(well);
    showSuccess(songName);
  })

  .fail(function(error) {
    console.log(error)
    error_message = "Name " + error.responseJSON.name[0];
    // resetErrors();
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
function showSuccess(song) {
  let successHelpBlock = $('<span class="help-block"></span>')
  .attr('id', 'error_message')
  .html(song + ' added!');

  $("#formgroup-title")
  .append(successHelpBlock);
}

function resetErrors() {
  $("#formgroup-title").removeClass("has-error")
  $(".help-block").remove();
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();

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

function deleteSong(event) {
  event.preventDefault();
  resetErrors();
  let path = window.location.pathname;
  let songId = $(this).attr('id');
  $.ajax({
    type: "DELETE",
    url: path + "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})
    .done(function(data) {
      console.log(data);
      $("#well-"+songId).remove();
    });
}
function deleteAllSongs() {
  resetErrors();
  $.each($(".delete-song").children(), function(key, song) {
    let $song = $(song);
    let songId = $(song).attr('id');
    let path = window.location.pathname;
    $.ajax({
      type: "DELETE",
      url: path + "/songs/" + songId + ".json",
      contentType: "application/json",
      dataType: "json"});
      $song.parent().parent().remove();
  });
}

$(document).ready(function() {
  $("#button-save").attr('data-disable-with', "Save")
  $("#new_song").on('submit', submitSong);
  $(".delete-song").children().on('click', deleteSong);
});
