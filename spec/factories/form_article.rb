FactoryBot.define do

  factory :form_article do
    created_user_id         {1}
    article_category        {73}
    article_format          {0}
    article_title           {"Mac キーボードショートカットキー"}
    page_text               {"MAC PCで画面をロックするショートカットキーは以下のうちどれ？"}
    option_correct          {"control + command + Q"}
    option_wrong            {"control + command + L"}
    article_price           {330}
    article_time_limit      {60}
    article_public          {1}
  end

end