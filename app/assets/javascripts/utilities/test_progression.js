document.addEventListener('turbolinks:load', function() {
  var completion = myProgress.dataset.progress
  var myBar = document.querySelector('.myBar')
  myBar.style.width = completion + '%'
  if (completion > 0) {
    myBar.classList.remove('hide')
  }
})
