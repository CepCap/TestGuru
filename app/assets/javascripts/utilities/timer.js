document.addEventListener('turbolinks:load', function() {
  setInterval(timeUpdate, 1000);
  var myTimer = document.querySelector('.myTimer');
  var timeTotal = myTimer.dataset.time;
  var count = 0;

  function timeUpdate() {
    count++;
    var timeLeft = timeTotal - count;
    var minutes = Math.floor(timeLeft/60);
    var seconds = timeLeft - minutes * 60;
    myTimer.innerHTML = minutes + " min. " + seconds + " seconds left.";
    if ((timeTotal - count) == 0) {
      window.location.reload();
    }
  }

})
