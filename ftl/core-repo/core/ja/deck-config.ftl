### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks = { $decks }個のデッキで使用中
deck-config-default-name = デフォルト
deck-config-title = デッキ設定

## Daily limits section

deck-config-daily-limits = 一日の上限
deck-config-new-limit-tooltip =
    一日に導入される新規カードの最大枚数。
    
    導入する新規カードの枚数が増加するほど、短期間での反復学習の量が一時的に増加し、過度な学習負荷につながります。そのため、一日あたりの新規カード出題枚数の上限は、一日あたりのカード出題枚数の上限の１０分の１以下とすることが推奨されます。
deck-config-review-limit-tooltip = 一日に表示される期日を迎えた復習カードの最大枚数。
deck-config-limit-deck-v3 = サブデッキを含むデッキを選択して学習する場合、それぞれのサブデッキから引き出されるカードの最大枚数は、それぞれのサブデッキで設定された上限によります。選択中のデッキのカードの合計枚数には、そのデッキで設定した上限が適用されます。
deck-config-limit-new-bound-by-reviews = 一日あたりのカード出題枚数の上限は、一日あたりの新規カード出題枚数の上限に影響を与えます。例えば、一日あたりのカード出題枚数の上限を200に設定し、期日を迎えたカードが190枚ある場合、最大10枚の新規カードが新たに導入されます。しかし、期日を迎えたカードの枚数が、一日あたりのカード出題枚数の上限を超えている場合、その日に新規カードは新たに導入されません。
deck-config-limit-interday-bound-by-reviews = 一日あたりのカード出題枚数の上限は、日付をまたいだ習得中（または再習得中）カードにも適用されます。上限を適用するとき、まず日付をまたいだ習得中（再習得中）カードが集められ、次に復習カード、最後に新規カードの順で集められます。
deck-config-tab-description =
    - `プリセット`: この上限は、このプリセットを使用する全てのデッキで共有されます。
    - `このデッキ`: この上限は、このデッキにのみ適用されます。
    - `今日だけ`: このデッキの上限を一時的に変更します。

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = プリセット
deck-config-deck-only = このデッキ
deck-config-today-only = 今日だけ

## New Cards section

deck-config-learning-steps = 習得ステップ
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = ステップは、分（例：`1m`）や日数（例：`2d`）で指定することがほとんどですが、時間（例：`1h`）や秒（例：`30s`）で指定することも可能です。
deck-config-learning-steps-tooltip =
    １回あるいは複数回のステップを、半角スペースをはさんで入力します。
    
    最初のステップは、新規カードの学習で「`やり直し`」ボタンを押した場合に適用され、デフォルトでは1分後に再び表示されるように入力されています。
    
    次のステップは、新規カードの学習で「`正解`」ボタンを押した場合に適用され、デフォルトでは10分後に再び表示されるように入力されています。
    
    すべてのステップをパスすると、そのカードは復習カードとなり、別の日に表示されます。
    
    { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = 最後の習得ステップで「`正解`」ボタンが押された場合に、そのカードが再び表示されるまでの日数。
deck-config-easy-interval-tooltip = 「`簡単`」ボタンが押され、習得中カードから復習カードへと直ちに切り替わった場合に、そのカードが再び表示されるまでの日数。
deck-config-new-insertion-order = 導入する順序
deck-config-new-insertion-order-tooltip = 新規カードを追加したとき、そのカードに与えられる位置（新規カード番号）の決め方を選択できます。新規カード番号が低い順にカードは表示されます。このオプションを変更すると、直ちに新規カードの位置が更新されます。
deck-config-new-insertion-order-sequential = 追加順
deck-config-new-insertion-order-random = ランダム
deck-config-new-insertion-order-random-with-v3 = V3スケジューラーでは、これを追加順のままにし、代わりに新規カードの収集方法を調整したほうがよいです。

## Lapses section

deck-config-relearning-steps = 再習得ステップ
deck-config-relearning-steps-tooltip =
    ０回あるいは複数回のステップを、半角スペースをはさんで入力します。
    
    デフォルトでは、復習カードで「`やり直し`」ボタンを押すと、10分後に再び表示されるように入力されています。何も入力されていない場合は、そのカードは再習得ステップに入らずに復習間隔が変更されます。
    
    { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    復習カードを無駄（定着困難）と判定するまでに「`やり直し`」ボタンを押す回数。
    
    無駄（定着困難）カードは、あなたの時間をたくさん浪費しているカードです。カードが無駄（定着困難）と判定された場合、そのカードを再編集するか、削除するか、あるいは記憶を助けるニーモニックを考えるなど、対策を講じることをおすすめします。
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `タグのみ`：そのノートに「leech」のタグがつき、ポップアップが表示されます。
    
    `カードを保留`：そのノートに「leech」のタグがつき、さらに手動で保留を解除するまではカードが表示されません。

## Burying section

deck-config-bury-title = 延期

## Ordering section

deck-config-ordering-title = 表示順序
deck-config-new-gather-priority = 新規カードを集めるときの優先順序
deck-config-new-gather-priority-deck = デッキ
deck-config-new-gather-priority-position-lowest-first = 位置（昇順）
deck-config-new-gather-priority-position-highest-first = 位置（降順）
deck-config-new-gather-priority-random-notes = ランダム（ノート単位）
deck-config-new-gather-priority-random-cards = ランダム（カード単位）
deck-config-new-card-sort-order = 集められた新規カードのソート方法
deck-config-sort-order-card-template-then-random = カードテンプレ後、ランダム
deck-config-sort-order-random-note-then-template = ノート単位でのランダム、さらにノート内ではカードタイプ単位でのランダム
deck-config-sort-order-random = ランダム
deck-config-sort-order-template-then-gather = カードテンプレ後、集められた順番
deck-config-sort-order-gather = 集められた順番
deck-config-new-review-priority = 新規カード表示のタイミング
deck-config-new-review-priority-tooltip = 新規カードを、復習カードとの関連でいつ表示するのか選択できます。
deck-config-interday-step-priority = 日付をまたいだ習得中（再習得中）カード表示のタイミング
deck-config-interday-step-priority-tooltip = 日付をまたいだ習得中（再習得中）カードをどのタイミングで表示するかを選択できます。
deck-config-review-mix-mix-with-reviews = 復習に混ぜ込む
deck-config-review-mix-show-after-reviews = 復習の後に表示
deck-config-review-mix-show-before-reviews = 復習の前に表示
deck-config-review-sort-order = 復習カードのソート方法
deck-config-review-sort-order-tooltip =
    デフォルトでは、最も長い時間を待機したカードが優先されるため、待機時間の長い順にカードが表示されます。
    復習カードが蓄積してすべてのカードをこなすのに数日以上を要する場合、あるいはサブデッキの順番でカード学習をしたい場合など、お好みで別のソート方法を選択することができます。
deck-config-sort-order-due-date-then-random = 期日の後、ランダム
deck-config-sort-order-due-date-then-deck = 期日の後、デッキ
deck-config-sort-order-deck-then-due-date = デッキの後、期日
deck-config-sort-order-ascending-intervals = 間隔（昇順）
deck-config-sort-order-descending-intervals = 間隔（降順）
deck-config-sort-order-ascending-ease = 易しさ昇順
deck-config-sort-order-descending-ease = 易しさ降順
deck-config-sort-order-relative-overdueness = 期日超過が相対的に大きい順
deck-config-display-order-will-use-current-deck = Ankiでは、選択中のデッキで設定された順序でカードが表示されます。デッキ内のサブデッキで異なる設定がされている場合でも同様です。

## Timer section

deck-config-timer-title = タイマー
deck-config-maximum-answer-secs = 最長回答秒数
deck-config-maximum-answer-secs-tooltip =
    カード学習に要した時間として記録する１件の回答の最長秒数。
    
    この秒数を超えた場合（例えば、カード学習の途中でスクリーンから離れた場合など）、ここで設定した最長秒数がそのカードの回答に要した時間として記録されます。
deck-config-show-answer-timer-tooltip = カード学習画面に、それぞれのカードの回答に要した時間をカウントするタイマーを表示します。

## Audio section

deck-config-audio-title = オーディオ
deck-config-disable-autoplay = オーディオを自動再生しない
deck-config-skip-question-when-replaying = 答えを再生するときに質問は再生しない
deck-config-always-include-question-audio-tooltip = 答え側のカードが表示されているときに再生ボタンを押した場合、質問側のオーディオも再生するのか、ここで選択することができます。

## Advanced section

deck-config-advanced-title = 詳細
deck-config-easy-bonus-tooltip = 復習カードに「簡単」と回答した際、そのカードの復習間隔に追加して適用される乗数。
deck-config-interval-modifier-tooltip = ここで設定する乗数はすべての復習に適用され、Ankiのスケジューリングの間隔をお好みに合わせて微調整することができます。この設定を変更する際にはマニュアルをご確認ください。
deck-config-hard-interval-tooltip = 「難しい」と回答した際、復習間隔に適用される乗数。
deck-config-new-interval-tooltip = 「やり直し」と回答した際、復習間隔に適用される乗数。
deck-config-minimum-interval-tooltip = 復習カードに`やり直し`と回答し、再学習ステップを完了した後にそのカードが再び表示されるまでの最短日数。
deck-config-custom-scheduling = カスタムスケジューリング
deck-config-custom-scheduling-tooltip = コレクション全体に影響します。ご自身の責任でご使用ください！

## Adding/renaming

deck-config-add-group = プリセットを追加
deck-config-name-prompt = 名前
deck-config-rename-group = プリセットの名前を変更
deck-config-clone-group = 同一のプリセットを追加

## Removing

deck-config-remove-group = プリセットを削除
deck-config-will-require-full-sync = この変更を行うには、一方の状態をもう片方に上書きする同期が必要です。他のデバイスでのカード学習や変更をまだ同期していない場合は、そちらを済ませてからこちらの同期を実行してください。
deck-config-confirm-remove-name = { $name }を削除しますか？

## Other Buttons

deck-config-save-button = 保存
deck-config-save-to-all-subdecks = すべてのサブデッキで保存
deck-config-revert-button-tooltip = この設定をデフォルトに戻す

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ ハンドリング
deck-config-description-new-handling-hint =
    入力をマークダウンとして扱い、HTML入力を除去します。有効化された場合、おめでとう画面でもこの詳細が表示されます。
    マークダウンは Anki 2.1.40 とそれ以下のバージョンではテクストとして表示されます。

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    親デッキの上限が{ $cards ->
       *[other] { $cards }枚
    }に設定されているため、そこでの上限がここにも適用されます。
deck-config-reviews-too-low =
    新規カードを毎日{ $cards ->
       *[other] { $cards }枚導入し、各カードの学習を継続していくには、
    }一日あたりのカード出題枚数の上限を、{ $expected }枚か、それより多い枚数とするのが妥当です。
deck-config-learning-step-above-graduating-interval = 最終ステップから復習開始までの間隔は、最低でも最終ステップと同じ長さの間隔が必要です。
deck-config-good-above-easy = 「簡単」と回答してから復習開始までの間隔は、最低でも最終ステップから復習開始までの間隔と同じ長さの間隔が必要です。
deck-config-relearning-steps-above-minimum-interval = 忘却カードの復習開始までの間隔は、最低でも再習得ステップの最後のステップと同じ長さの間隔が必要です。
deck-config-maximum-answer-secs-above-recommended = 質問を短くすることで、Ankiはより効率的な復習をスケジュールすることができます。

## Selecting a deck

deck-config-which-deck = どのデッキを選択しますか？

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

deck-config-bury-new-siblings = 新規カードの兄弟を翌日に延期する
deck-config-bury-review-siblings = 復習カードの兄弟を翌日に延期する
deck-config-bury-interday-learning-siblings = 日付をまたいだ習得中カードの兄弟を延期する
