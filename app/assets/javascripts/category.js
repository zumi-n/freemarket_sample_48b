$(function(){
  $('.navi-icon li').mouseover(function(){
    $('.pc-header-nav-parent-wrap').show();
  });
  $('.navi-icon li').mouseout(function(){
    $('.pc-header-nav-parent-wrap').hide();
  });
  $('.pc-header-nav-parent-wrap li').hover(function(){
    $(this).children('ul').show();
    $(this).siblings().find('ul').hide();
  });
});

