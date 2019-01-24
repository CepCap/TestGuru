document.addEventListener('turbolinks:load', function() {
  var myProgress = document.querySelector('.myProgress')
  var completion = myProgress.dataset.progress
  myProgress.onload = move(completion)
})


function move(completion) {
  var myBar = document.querySelector('.myBar')
  var width = 1
  var id = setInterval(frame, 10)
  function frame() {
    if (width >= 100) {
      clearInterval(id)
    } else {
      myBar.style.width = completion + '%'
    }
  if (completion > 0) {
    myBar.classList.remove('hide')
  }
  }
}
