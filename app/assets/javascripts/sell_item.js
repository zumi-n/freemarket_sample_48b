$(function(){
  $('#item_price').keyup(function(){
    var price = $(this).val();
    if ( price >= 300 ){
      var commission = Math.ceil(price * 0.1) ;
      var profit = price - commission
      $('#item_commission').text('¥' + commission);
      $('#item_profit').text('¥' + profit);
    } else{
      $('#item_commission').text('-');
      $('#item_profit').text('-');
    }
  });
});


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
