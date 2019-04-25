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
    if ( $('#item_images_attributes_0_file').val().length == 0 ){
      $('#image-error').removeClass("hide");
    } else {
      $('#image-error').addClass("hide");
    }
    if ( $('#item_name').val().length == 0 ){
      $('#name-error').removeClass("hide");
    } else {
      $('#name-error').addClass("hide");
    }
    if ( $('#item_description').val().length == 0 ){
      $('#description-error').removeClass("hide");
    } else {
      $('#description-error').addClass("hide");
    }
    if ( $('#item_category_id').val().length == 0 ){
      $('#category-error').removeClass("hide");
    } else {
      $('#category-error').addClass("hide");
    }
    if ( $('#item_condition').val().length == 0 ){
      $('#condition-error').removeClass("hide");
    } else {
      $('#condition-error').addClass("hide");
    }
    if ( $('#item_delivery_attributes_method').val().length == 0 ){
      $('#method-error').removeClass("hide");
    } else {
      $('#method-error').addClass("hide");
    }
    if ( $('#item_delivery_attributes_payer').val().length == 0 ){
      $('#payer-error').removeClass("hide");
    } else {
      $('#payer-error').addClass("hide");
    }

    if ( $('#item_delivery_attributes_area').val().length == 0 ){
      $('#area-error').removeClass("hide");
    } else {
      $('#area-error').addClass("hide");
    }
    if ( $('#item_delivery_attributes_date').val().length == 0 ){
      $('#date-error').removeClass("hide");
    } else {
      $('#date-error').addClass("hide");
    }
    if ( $('#item_price').val().length == 0 ){
      $('#price-error').removeClass("hide");
    } else {
      $('#price-error').addClass("hide");
    }
    $("#item-sell-submit-btn").removeClass('disabled');
  })
})
