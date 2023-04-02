## The next time a card will be shown, in a short form that will fit
## on the answer buttons. For example, English shows "4d" to
## represent the card will be due in 4 days, "3m" for 3 minutes, and
## "5mo" for 5 months.

scheduling-answer-button-time-seconds = { $amount }秒後
scheduling-answer-button-time-minutes = { $amount }分後
scheduling-answer-button-time-hours = { $amount }時間後
scheduling-answer-button-time-days = { $amount }日後
scheduling-answer-button-time-months = { $amount }ヵ月後
scheduling-answer-button-time-years = { $amount }年後

## A span of time, such as the delay until a card is shown again, the
## amount of time taken to answer a card, and so on. It is used by itself,
## such as in the Interval column of the browse screen,
## and labels like "Total Time" in the card info screen.

scheduling-time-span-seconds = { $amount } 秒
scheduling-time-span-minutes = { $amount } 分
scheduling-time-span-hours = { $amount } 時間
scheduling-time-span-days = { $amount } 日
scheduling-time-span-months = { $amount } ヵ月
scheduling-time-span-years = { $amount } 年

## Shown in the "Congratulations!" message after study finishes.

# eg "The next learning card will be ready in 5 minutes."
scheduling-next-learn-due =
    次の習得中カードは { $unit ->
        [seconds] { $amount }秒
        [minutes] { $amount }分
       *[hours] { $amount }時間
    }後に表示されます。
scheduling-learn-remaining =
    { $remaining ->
       *[other] 本日中に再び表示される習得中カードが{ $remaining }あります。
    }
scheduling-congratulations-finished = おめでとうございます！　このデッキの今日の課題を全て達成しました！
scheduling-today-review-limit-reached =
    復習カードはまだ残ってますが、今日の出題上限に達しました。
    適正な記憶力に見合った、一日の制限値まで引き上げることを検討してください。
scheduling-today-new-limit-reached = まだ新規カードは残っていますが、設定した一日の上限に達しました。学習設定より上限を変更することも可能ですが、それにより短期的に一日の復習量が増え、しばらくの間、通常よりも学習負荷がかかりますのでご注意ください。
scheduling-buried-cards-found = 一枚かそれ以上の延期されたカードが明日表示されます。{ $unburyThem }することで、それらのカードをただちに表示することもできます。
# used in scheduling-buried-cards-found
# "... you can unbury them if you wish to see..."
scheduling-unbury-them = 延期を解除
scheduling-how-to-custom-study = 通常のスケジュール外で学習したい場合、{ $customStudy }機能を活用することもできます。
# used in scheduling-how-to-custom-study
# "... you can use the custom study feature."
scheduling-custom-study = カスタム学習

## Scheduler upgrade

scheduling-update-soon = Anki 2.1 では新しいスケジューラーが使用されています。古いバージョンで発生した問題の多くが解決されているため、アップデートすることをおすすめします。
scheduling-update-done = スケジューラーをアップデートしました。
scheduling-update-button = アップデート
scheduling-update-later-button = 後で
scheduling-update-more-info-button = 詳細
scheduling-update-required = あなたのコレクションは、V2スケジューラーにアップグレードする必要があります。続行する前に{ scheduling-update-more-info-button }を選択してください。

## Other scheduling strings

scheduling-always-include-question-side-when-replaying = オーディオ再生の際、質問側のオーディオも必ず含める
scheduling-at-least-one-step-is-required = 最低でも一つのステップが必要です。
scheduling-automatically-play-audio = 音声を自動再生する
scheduling-bury-related-new-cards-until-the = 関連する新規カードを翌日まで延期する
scheduling-bury-related-reviews-until-the-next = 関連カードの復習を翌日まで延期する
scheduling-days = 日
scheduling-description = 詳細
scheduling-easy-bonus = 「簡単」と回答した時のボーナス
scheduling-easy-interval = 「簡単」と回答してから復習開始までの間隔
scheduling-end = (終了)
scheduling-general = 一般
scheduling-graduating-interval = 最終ステップから復習開始までの間隔
scheduling-hard-interval = 「難しい」と回答した場合の間隔
scheduling-ignore-answer-times-longer-than = 統計に利用する解答時間の最大値
scheduling-interval-modifier = 復習ペースの調整
scheduling-lapses = 忘却
scheduling-lapses2 = 回
scheduling-learning = 習得（再習得）中
scheduling-leech-action = 無駄（定着困難）カードへの処置
scheduling-leech-threshold = 無駄（定着困難）カードと判定する忘却回数
scheduling-maximum-interval = 復習間隔の上限
scheduling-maximum-reviewsday = 一日あたりのカード出題枚数の上限
scheduling-minimum-interval = 忘却カードの復習開始までの間隔
scheduling-mix-new-cards-and-reviews = 新規カードと学習カードを混ぜる
scheduling-new-cards = 新規カード
scheduling-new-cardsday = 一日あたりの新規カード出題枚数の上限
scheduling-new-interval = 新しい復習間隔（前回比）
scheduling-new-options-group-name = 新しいオプショングループ名:
scheduling-options-group = オプショングループ
scheduling-order = 順番
scheduling-parent-limit = (元の最大出題数は { $val })
scheduling-reset-counts = 学習頻度と忘却回数をリセット
scheduling-restore-position = 可能な限り元の位置を復元する
scheduling-review = 復習
scheduling-reviews = 復習
scheduling-seconds = 秒
scheduling-set-all-decks-below-to = このオプショングループをこのデッキ「{ $val }」内の全てのサブデッキにも適用しますか？
scheduling-set-for-all-subdecks = 全てのサブデッキに適用する
scheduling-show-answer-timer = 解答タイマーを表示する
scheduling-show-new-cards-after-reviews = 復習カードの後に新規カードを学習する
scheduling-show-new-cards-before-reviews = 復習カードの前に新規カードを学習する
scheduling-show-new-cards-in-order-added = 新規カードを追加順に表示する
scheduling-show-new-cards-in-random-order = 新規カードを無作為に選んで表示する
scheduling-starting-ease = 復習開始時の間隔の伸び率
scheduling-steps-in-minutes = 習得ステップ（分）
scheduling-steps-must-be-numbers = 習得ステップは数字で指定してください。
scheduling-tag-only = タグを付けるだけ
scheduling-the-default-configuration-cant-be-removed = 既定の設定「Default」は削除できません。
scheduling-your-changes-will-affect-multiple-decks = この変更は複数のデッキに影響が及びます。現在のデッキのみに変更を加えたい時には、まず最初にオプショングループを新規追加してください。
scheduling-deck-updated =
    { $count ->
       *[other] { $count } 個のデッキを更新しました。
    }
scheduling-set-due-date-prompt =
    { $cards ->
       *[other] 何日後にカードを表示しますか？
    }
scheduling-set-due-date-prompt-hint =
    0 = 今日
    1! = 明日+復習間隔をリセット
    3-7 = 3-7日からランダムに選択
scheduling-set-due-date-done =
    { $cards ->
       *[other] { $cards }枚のカードの期日を設定しました。
    }
scheduling-forgot-cards =
    { $cards ->
       *[other] { $cards }枚のカードをリセットしました。
    }
