$(function(){

  send_file_obj = {}
  var stock_index = []
  // プレビューの表示、表示、送信ファイル作成
  function make_preview(send_img_cnt,filelist){

    var num = stock_index.length
    $.each(filelist, function(i,file){
      stock_index.push(i)
      if (send_img_cnt > 0){
        var i = i + num
      }
      send_file_obj[i] = file
      // ファイルリーダーのインスタンスを作成する
      var reader = new FileReader();
      // ファイルの読み込みが成功した時の記述
      reader.onload =function(e){
        var url = e.target.result;
        // imageをデータとして取得する
        var preview =
  ` <li class="upload-item" data-id='${i}'>
    <figure class="upload-figure square">
      <img src="${url}">
    </figure>
    <div class="upload-btn">
      <a class="upload-btn__edit">編集</a>
      <a class="upload-btn__delete">削除</a>
    </div>
  </li>`

        $('#image-list-before').before(preview);
        change_drop_box_size();

      }
      reader.readAsDataURL(file);
    })

  }

  function change_drop_box_size(){
    var preview_num = $('#image-list').children().length - 1;
    if (preview_num === 0 || preview_num === 5){
      $('#image-list-before').css('width','620');
      $('#image-list-before').removeClass("hide");
    } else if (preview_num === 1 || preview_num === 6){
      $('#image-list-before').css('width','491');
      $('#image-list-before').removeClass("hide");
    } else if (preview_num === 2 || preview_num === 7){
      $('#image-list-before').css('width','363');
      $('#image-list-before').removeClass("hide");
    } else if (preview_num === 3 || preview_num === 8){
      $('#image-list-before').css('width','234');
      $('#image-list-before').removeClass("hide");
    } else if (preview_num === 4 || preview_num === 9){
      $('#image-list-before').css('width','106');
      $('#image-list-before').removeClass("hide");
    } else if (preview_num === 10){
      $('#image-list-before').addClass("hide");
    } else {
      $('#image-list-before').removeClass("hide");
    }
  };

  // プレビューの削除
  $(function(){
    $('#image-list').on('click','.upload-btn__delete',function(){
      var preview_box = $(this).parent().parent()
      var i = preview_box.attr('data-id');
      preview_box.remove();
      delete send_file_obj[i]
      change_drop_box_size();
    });
  });
// -------------------------------------------------------------------
  // 発火（D&D）
  $('#image-drop-box').on('dragover',function(e){
    e.preventDefault();
  })

  $('#image-drop-box').on('drop',function(e){
    e.preventDefault();
    var image_filelist = e.originalEvent.dataTransfer.files;
    var file_count = image_filelist.length
    var send_img_cnt = Object.keys(send_file_obj).length

    if ( file_count != 0 && file_count + send_img_cnt <= 10){
      make_preview(send_img_cnt,image_filelist);
      $('#item_image_attributes_file').val('');
    }
  })

// --------------------------------------------------------
  // 発火（File_field）
  $('#item_image_attributes_file').change(function(){
    // 投稿された画像をfileオブジェクトで取得する
    var image_filelist = $('#item_image_attributes_file').prop('files');
    var file_count = image_filelist.length;
    var send_img_cnt = Object.keys(send_file_obj).length;

    if ( file_count != 0 && file_count + send_img_cnt <= 10){
      make_preview(send_img_cnt,image_filelist);
      $('#item_image_attributes_file').val('');
    }
  })
// -----------------------------------------------------------


// submit-btn押下
  $('#new_item').on('submit',function(event){
    event.preventDefault();
    var formdata = new FormData(this);
    console.log(send_file_obj);
    console.log(formdata);
    $.each(send_file_obj,function(index,file){
      formdata.append('item[image_attributes][file][]',file)
    })
    $.ajax({
      url: '/items',
      type: 'POST',
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(){
      $(".modal-overlay").fadeIn(200);
      $(".modal-screen").fadeIn(200);
    })
    .fail(function(){
      if ( !send_file_obj[0] ){
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

      $("#item-sell-submit-btn").prop("disabled", false);

    })
  })
})


// 利益計算
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






