$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}">${category.name}</option>`;
      return html;
    }
    // 親カテゴリの表示作成
    function appendParentsBox(insertHTML){
      var parentSelectHtml = `<div class="article1__categories__parent-category">
                                <select class="article1__categories__parent-category__select" name="article[category_id]" id="parent_category">
                                  <option value="">選択してください</option>
                                  ${insertHTML}
                                <select>
                              </div>`;
      $('.article1__categories-append').append(parentSelectHtml);
    }
    // 子カテゴリの表示作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = `<div class="article1__categories__child-category">
                               <select class="article1__categories__child-category__select" name="article[category_id]" id="child_category">
                                 <option value="">選択してください</option>
                                 ${insertHTML}
                               <select>
                             </div>`;
      $('.article1__categories-append').append(childSelectHtml);
    }
    // ルートカテゴリ選択後のイベント
    $("#article_category").on("change", function() {
      var rootId = document.getElementById("article_category").value;
      if (rootId != "") {
        // ルートカテゴリが初期値でないことを確認
        $.ajax({
          url: '/articles/get_category_parents',
          type: 'GET',
          data: { root_id: rootId },
          dataType: "json"
        })
        .done(function(parents) {
          $(".article1__categories__parent-category").remove(); //ルートカテゴリが変更された時、親以下を削除する
          $(".article1__categories__child-category").remove();
          var insertHTML = "";
          parents.forEach(function(parent) {
            insertHTML += appendOption(parent);
          });
          appendParentsBox(insertHTML);
        })
        .fail(function() {
          alert("親カテゴリ取得に失敗しました");
        });
    } else {
      $(".article1__categories__parent-category").remove(); //ルートカテゴリが初期値になった時、子以下を削除する
      $(".article1__categories__child-category").remove();
      }
    });

    // 親カテゴリ選択後のイベント
    $(document).on("change", "#parent_category", function() {
      var parentId = $("#parent_category").val(); //選択された親カテゴリのidを取得
      if (parentId != "") {
        // 親カテゴリが初期値でないことを確認
        $.ajax({
          url: '/articles/get_category_children',
          type: 'GET',
          data: { parent_id: parentId },
          dataType: "json"
        })
        .done(function(children) {
          console.log(children);
          if (children.length != 0) {
            $(".article1__categories__child-category").remove(); //親カテゴリが変更された時、子を削除する
            var insertHTML = "";
            children.forEach(function(child) {
              insertHTML += appendOption(child);
            });
            console.log(insertHTML);
            appendChildrenBox(insertHTML);
          }
        })
        .fail(function() {
          alert("子カテゴリ取得に失敗しました");
        });
      } else {
        $(".article1__categories__child-category").remove(); //親カテゴリが初期値になった時、子を削除する
      }
    });
  });
});
