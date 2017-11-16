function createSong(name, release_date, duration) {
  var newSong = { name: name, release_date: release_date, duration: duration};
  var path = window.location.pathname

  $.ajax({
    type: "POST",
    url: path + "songs.json",
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
    // showError(error_message);
  });
}
