document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var confirm_password = document.getElementById('user_password_confirmation')

  confirm_password.oninput = function() {
    if ( password.value == confirm_password.value) {
      confirm_password.style.color = 'green'
    } else {
      confirm_password.style.color = "red";
    }
  }
})
