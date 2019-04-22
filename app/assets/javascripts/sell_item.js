$(function(){
  $('#sell-item').on('submit', function(e){
    e.preventDefault();
    $('.fail-comment').removeClass("hide");
  })
})

// $(function(){
//   $('#sell-item').on('submit', function(e){
//     e.preventDefault();
//     var formdata = new FormData(this);

//     $.ajax({
//       url: '/items',
//       type: 'POST',
//       data: formdata,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     }).done(function(){
//       console.log("OK");
//     }).fail(function(){
//       console.log("NG");
//     })
//   })
// })
