$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" required>${category.name}</option>`;
      return html;
    }
    // 親カテゴリの表示作成
    function appendParentsBox(insertHTML){
      var parentSelectHtml = `<select class="article1__categories__category-select" name="form_article[article_category]" id="parentCategory">
                                <option value="">選択してください</option>
                                ${insertHTML}
                              <select>`;
      $('#categoriesAppend').append(parentSelectHtml);
    }
    // 子カテゴリの表示作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = `<select class="article1__categories__category-select" name="form_article[article_category]" id="childCategory">
                               <option value="">選択してください</option>
                               ${insertHTML}
                             <select>`;
      $('#categoriesAppend').append(childSelectHtml);
    }
    // ルートカテゴリ選択後のイベント
    $("#articleCategory").on("change", function() {
      var rootId = document.getElementById("articleCategory").value;
      if (rootId != "") {
        // ルートカテゴリが初期値でないことを確認
        $.ajax({
          url: '/articles/get_category_parents',
          type: 'GET',
          data: { root_id: rootId },
          dataType: "json"
        })
        .done(function(parents) {
          $("#parentCategory").remove(); //ルートカテゴリが変更された時、親以下を削除する
          $("#childCategory").remove();
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
      $("#parentCategory").remove(); //ルートカテゴリが初期値になった時、子以下を削除する
      $("#childCategory").remove();
      }
    });

    // 親カテゴリ選択後のイベント
    $(document).on("change", "#parentCategory", function() {
      var parentId = $("#parentCategory").val(); //選択された親カテゴリのidを取得
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
            $("#childCategory").remove(); //親カテゴリが変更された時、子を削除する
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
        $("#childCategory").remove(); //親カテゴリが初期値になった時、子を削除する
      }
    });
  });
});
