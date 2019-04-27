document.addEventListener(
  "DOMContentLoaded", e => {
    Payjp.setPublicKey("pk_test_5c749df69c612790371ab4d1");
    let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得される
    btn.addEventListener("click", (e) => {　//ボタンが押されたときに作動します
      e.preventDefault();　//ボタンを一旦無効化します
      
      //カード情報生成
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; //入力されたデータを取得します。
      
      //トークン生成
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { //成功した場合
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //取得したトークンを送信できる状態にします
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
          // document.getElementById('card_token').innerHTML = response.card.id;
        } else {
          alert("カード情報が正しくありません。"); //確認用
          document.getElementById('card_token').innerHTML = response.id;
        }
      });
    });
  },
  false
);