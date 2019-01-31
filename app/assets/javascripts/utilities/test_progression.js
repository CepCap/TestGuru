document.addEventListener('turbolinks:load', function() {
  var myProgress = document.querySelector('.myProgress')
  var completion = myProgress.dataset.progress
  // myProgress.onload = move(completion)
  var myBar = document.querySelector('.myBar')
  myBar.style.width = completion + '%'
  if (completion > 0) {
    myBar.classList.remove('hide')
  }
})

// 
// function move(completion) {
//   var myBar = document.querySelector('.myBar')
//   myBar.style.width = completion + '%'
//   if (completion > 0) {
//     myBar.classList.remove('hide')
//   }
// }
