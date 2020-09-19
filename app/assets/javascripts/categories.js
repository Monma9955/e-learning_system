$(document).on('turbolinks:load', function(){
  $(function(){

    // 問題一覧のアコーディオンメニュー表示・非表示イベント
    $('.articles').hide();
    $('.child-name').click(function(){
      $(this).next('.articles').slideToggle('fast');
    });

  });
});
