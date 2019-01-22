document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var confirm_password = document.getElementById('user_password_confirmation')

  confirm_password.oninput = function() {
    if (confirm_password.value.length == 0) {
      confirm_password.style.color = ""
    } else {
      if ( password.value == confirm_password.value) {
        confirm_password.style.color = 'green'
      } else {
        confirm_password.style.color = "red";
      }
    }
  }
})
