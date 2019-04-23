$(function(){
  $('.image-small img').hover(function(){
    $('.image-main img').attr('src', $(this).attr('src'));
  });
});