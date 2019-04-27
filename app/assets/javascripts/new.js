$(document).on('turbolinks:load', function() {

  //$('#user_nickname').removeClass("inp_error");

  var nickname = $("#user_nickname").val();
  //window.alert('表示させたいテキスト');

    if(nickname == ""){
      //$("#name_error").html("<i class='fa fa-exclamation-circle'></i> お名前は必須です。");
      //$("#user_nickname").addClass("inp_error");
      result = false;
    }

  $(".ur-form__btn--submit").onclick('submit', function(e) {
      window.alert('表示させたいテキスト');
  });
})


