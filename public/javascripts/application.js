SC.initialize({
  client_id: 'e7e960ffba3f725701fba044110bbfcd'
});

function initSong(trackId, elementId) {

  SC.get("/tracks/" + trackId, function(track){

    var waveform = new Waveform({
      container: document.getElementById(elementId),
      innerColor: "#eee"
    });

    waveform.dataFromSoundCloudTrack(track);
    var streamOptions = waveform.optionsForSyncedStream(
      {"playedColor": "#FFCB52",
        "loadedColor": "#eee",
        "defaultColor": "#eee"
    });
    streamOptions["onfinish"] = function() {
      showPlay(trackId);
    }
    streamOptions["onpause"] = function() {
      showPlay(trackId);
    }
    streamOptions["onresume"] = function() {
      showPause(trackId);
    }
    streamOptions["onplay"] = function() {
      showPause(trackId);
    }
    SC.stream(track.uri, streamOptions, function(sound) {
      window[track.permalink_url] = sound;
    });
  });

  $(window).resize(function() {
    $('#' + elementId + ' canvas').css('width', $(window).width());
  });
}

function showPlay(id) {
  $("a#" + id + " .control-icons .fa-play").show();
  $("a#" + id + " .control-icons .fa-pause").hide();
}

function showPause(id) {
  $("a#" + id + " .control-icons .fa-play").hide();
  $("a#" + id + " .control-icons .fa-pause").show();
}

$(function() {
  $('a.song').on('mouseenter', function() {
    $(this).find('.waveform').css('background-color', '#eee');
    $(this).find('.waveform-bg').css('background-color', 'white');
    $(this).find('.control-icons .fa-play').css('color', '#999');
    $(this).find('.control-icons .fa-pause').css('color', '#999');
  });
  $('a.song').on('mouseleave', function() {
    $(this).find('.waveform').css('background-color', 'white');
    $(this).find('.waveform-bg').css('background-color', 'white');
    $(this).find('.control-icons .fa-play').css('color', '#eee');
    $(this).find('.control-icons .fa-pause').css('color', '#eee');
  });
})

