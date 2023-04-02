### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks = { $decks } 個牌組正在使用
deck-config-default-name = 預設
deck-config-title = 牌組選項

## Daily limits section

deck-config-daily-limits = 每日上限
deck-config-new-limit-tooltip = 有新卡片可學習時，當天的新卡片數量上限。加入新的內容會使近期的複習量加重，因此該選項通常應設定為複習上限的 10% 或更少。
deck-config-review-limit-tooltip = 有複習卡可學習時，當天的複習卡數量上限。
deck-config-limit-deck-v3 = 學習牌組時，若其包含子牌組，子牌組在父牌組中顯示的卡片數量不會超過子牌組本身設定的上限。選取的牌組設定的數量上限包含所有子牌組的卡片。
deck-config-limit-new-bound-by-reviews = 複習上限會影響新卡片上限。若複習上限設為 200，且有 190 張卡片待複習，則最多只會顯示 10 張新卡片。若已達到或超出複習上限，則不會再顯示新卡片。
deck-config-limit-interday-bound-by-reviews = 複習上限也會影響隔天學習的卡片。計算數量上限時，卡片擷取的優先順序為：隔天學習的卡片>複習卡>新卡片。
deck-config-tab-description =
    - `預設設定`：所有使用此預設設定的牌組的上限。
    - `當前牌組`：當前牌組的上限。
    - `僅限今天`：暫時更改當前牌組的的上限。

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = 預設設定
deck-config-deck-only = 當前牌組
deck-config-today-only = 僅限今天

## New Cards section

deck-config-learning-steps = 學習階段
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = 延遲時間通常使用分鐘（如 `5m`）或天（如 `2d`），但也支援小時（如 `1h`）和秒（如 `30s`）。
deck-config-learning-steps-tooltip = 一或多段延遲，用空白分隔。第一段延遲是你學習新卡片時，按下 `重來` 按鈕後的延遲時間，預設值為 1 分鐘。按下 `良好` 按鈕將會前進到下一個階段，預設值為 10 分鐘。完成所有階段後，卡片即成為複習卡，並將改天出現。{ -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = 在最後一個學習階段按下 `良好` 按鈕後，卡片再次出現前需等待的天數。
deck-config-easy-interval-tooltip = 按下 `簡單` 按鈕直接跳過學習階段後，再次顯示卡片前需等待的天數。
deck-config-new-insertion-order = 插入順序
deck-config-new-insertion-order-tooltip = 控制新卡片被指派的順序（到期 #）。卡片到期序號越小，在學習時就越早顯示。更改此選項將自動更新現有新卡片順序。
deck-config-new-insertion-order-sequential = 循序（最舊的卡片在前）
deck-config-new-insertion-order-random = 隨機
deck-config-new-insertion-order-random-with-v3 = 使用 V3 排程器時，建議將此選項保留為循序，改用新卡片收集順序調整。

## Lapses section

deck-config-relearning-steps = 重新學習階段
deck-config-relearning-steps-tooltip = 零或多段延遲，用空白分隔。在複習卡按下 `重來` 按鈕後，預設會在 10 分鐘後重新出現。若沒有提供延遲，卡片則將改變間隔，但不會進入重新學習狀態。{ -deck-config-delay-hint }
deck-config-leech-threshold-tooltip = 在複習卡按下 `重來` 多少次後將被標記為榨時卡。榨時卡耗費了你大量的時間，對待榨時卡最好的方法是將其重寫、刪除，或是使用縮寫、口訣等方式來幫助記憶。
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `僅加上標籤`：對筆記加上「榨時卡」標籤，並顯示一個彈出式視窗。
    
    `擱置卡片`：對筆記加上「榨時卡」標籤，並隱藏卡片，直到你手動取消擱置卡片。

## Burying section

deck-config-bury-title = 暫停
deck-config-bury-siblings = 回答後暫停關聯卡片
deck-config-do-not-bury = 不暫停關聯卡片
deck-config-bury-if-new = 暫停新卡片
deck-config-bury-if-new-or-review = 暫停新卡片/複習卡
deck-config-bury-if-new-review-or-interday = 暫停新卡片/複習卡/跨天學習卡片
deck-config-bury-tooltip =
    關聯卡片是指由同一則筆記建立的其他卡片（如正面/反面卡片，或同一則克漏字的其他空格）。
    
    停用時，一則筆記的多張卡片有機會在同一天出現。啟用時，Anki 會自動**暫停**關聯卡片，直到下一天前都不會出現。這個選項可以讓你選擇在回答時要暫停哪些卡片。
    
    使用 V3 排程器時，跨天學習卡片也可以被暫停。跨天學習卡片是指當前學習階段為一天或更多的卡片。

## Ordering section

deck-config-ordering-title = 顯示順序
deck-config-new-gather-priority = 新卡片收集順序
deck-config-new-gather-priority-tooltip-2 =
    `牌組順序`：依牌組順序，由上至下收集卡片。依照遞增順序收集各個牌組中的卡片。若選取的牌組已達每日上限，收集卡片時可能不會檢查到部分牌組。在較大的集合中，此選項的速度最快，並讓你能夠優先學習靠上的子牌組。
    
    `遞增順序`：依遞增順序收集卡片（到期 #），通常依新增順序從早到晚排序。
    
    `遞減順序`：依遞減順序收集卡片（到期 #），通常依新增順序從晚到早排序。
    
    `隨機筆記`：從隨機選取的筆記中收集卡片。當停用暫停關聯卡片時，同一則筆記中的所有卡片可以在單次學習中同時出現（如「正面->背面」和「背面->正面」兩張卡片同時出現）
    
    `隨機卡片`：完全隨機收集卡片。
deck-config-new-gather-priority-deck = 牌組順序
deck-config-new-gather-priority-position-lowest-first = 遞增順序
deck-config-new-gather-priority-position-highest-first = 遞減順序
deck-config-new-gather-priority-random-notes = 隨機筆記
deck-config-new-gather-priority-random-cards = 隨機卡片
deck-config-new-card-sort-order = 新卡片排序順序
deck-config-new-card-sort-order-tooltip-2 =
    `卡片類型`：顯示順序按卡片類型的序號來排序。當停用暫停關聯卡片時，此選項將讓任何「正面→背面」卡片在「背面→正面」之前顯示。若你要在單次學習中顯示同一則筆記的所有卡片，此選項可以幫你拉開關聯卡片之間顯示的間隔。
    
    `收集順序`：按照收集順序顯示卡片。當停用暫停關聯卡片時，此選項通常會讓同一則筆記的所有卡片連續出現。
    
    `卡片類型→隨機`：類似 `卡片類型`，但會在卡片類型序號相同的卡片之間隨機排序。當使用 `遞增順序` 按建立時間從早到晚的順序收集卡片時，此選項可以隨機顯示這些卡片，同時同一則筆記的不同卡片的顯示順序也不會太接近。
    
    `隨機筆記→卡片類型`：隨機挑選筆記，然後順序顯示所有關聯卡片。
    
    `隨機`：完全隨機顯示收集的卡片。
deck-config-sort-order-card-template-then-random = 卡片類型→隨機
deck-config-sort-order-random-note-then-template = 隨機筆記→卡片類型
deck-config-sort-order-random = 隨機
deck-config-sort-order-template-then-gather = 卡片類型
deck-config-sort-order-gather = 收集順序
deck-config-new-review-priority = 新卡片/複習卡優先順序
deck-config-new-review-priority-tooltip = 新卡片與複習卡顯示的先後順序。
deck-config-interday-step-priority = 隔天學習/複習卡優先順序
deck-config-interday-step-priority-tooltip =
    隔天學習時，（重新）學習中的卡片的顯示順序。
    
    複習上限總是優先計算隔天學習的卡片，再套用到複習卡。此選項將控制收集的卡片的顯示順序，但跨天學習卡片永遠會被優先收集。
deck-config-review-mix-mix-with-reviews = 與複習卡混合
deck-config-review-mix-show-after-reviews = 先顯示複習卡
deck-config-review-mix-show-before-reviews = 後顯示複習卡
deck-config-review-sort-order = 複習卡排序順序
deck-config-review-sort-order-tooltip = 預設的順序會優先顯示等待最久的卡片，這樣當有複習卡積壓時，等待最久的卡片將會最早出現。若你需要好幾天的時間來清理積壓的內容，或者想要以子牌組順序顯示卡片，建議尋找其他更合適的順序。
deck-config-sort-order-due-date-then-random = 到期日期→隨機
deck-config-sort-order-due-date-then-deck = 到期日期→牌組順序
deck-config-sort-order-deck-then-due-date = 牌組順序→到期日期
deck-config-sort-order-ascending-intervals = 間隔遞增
deck-config-sort-order-descending-intervals = 間隔遞減
deck-config-sort-order-ascending-ease = 輕鬆度遞增
deck-config-sort-order-descending-ease = 輕鬆度遞減
deck-config-sort-order-relative-overdueness = 依相對逾期跨度
deck-config-display-order-will-use-current-deck = 顯示順序以你選取學習的牌組為準，Anki 將無視子牌組的順序。

## Timer section

deck-config-timer-title = 計時器
deck-config-maximum-answer-secs = 最大回答秒數
deck-config-maximum-answer-secs-tooltip = 為單次複習記錄的最大秒數。若回答超過此時間（例如可能你複習中途離開了螢幕一段時間），那麼卡片花費的時間將會被記為你所設定的上限。
deck-config-show-answer-timer-tooltip = 在複習畫面顯示一個計時器，計算複習每張卡片所花費的秒數。

## Audio section

deck-config-audio-title = 音訊
deck-config-disable-autoplay = 不要自動播放音訊
deck-config-disable-autoplay-tooltip = 啟用後，Anki 不會自動播放音訊。你可以按下音訊按鈕，或使用播放音訊動作來手動播放。
deck-config-skip-question-when-replaying = 重播答案時跳過問題
deck-config-always-include-question-audio-tooltip = 啟用後，在卡片答案面執行播放動作時將不會同時播放問題面上的音訊。

## Advanced section

deck-config-advanced-title = 進階選項
deck-config-maximum-interval-tooltip = 複習卡將等待的最大天數。當複習卡達到上限時，`困難`、`良好` 和 `簡單` 的延遲將會一致。此選項設定得越短，你的學習量將會越多。
deck-config-starting-ease-tooltip = 新卡片輕鬆度的起始乘數。在預設設定下，在一張剛學完的卡片按下 `良好` 按鈕後，下次複習前的延遲為上次的 2.5 倍。
deck-config-easy-bonus-tooltip = 回答 `簡單` 後，額外對複習間隔套用的乘數。
deck-config-interval-modifier-tooltip = 此乘數套用於所有複習卡，對其稍作修改能使 Anki 排程更為保守/激進。請在更改此選項前參閱使用手冊。
deck-config-hard-interval-tooltip = 回答 `困難` 後，對複習間隔套用的乘數。
deck-config-new-interval-tooltip = 回答 `重來` 後，對複習間隔套用的乘數。
deck-config-minimum-interval-tooltip = 複習卡回答 `困難` 後的最小間隔。
deck-config-custom-scheduling = 自訂排程
deck-config-custom-scheduling-tooltip = 影響整個集合。請謹慎使用！

## Adding/renaming

deck-config-add-group = 新增預設設定
deck-config-name-prompt = 名稱：
deck-config-rename-group = 重新命名預設設定
deck-config-clone-group = 複製預設設定

## Removing

deck-config-remove-group = 移除預設設定
deck-config-will-require-full-sync = 更改後，下次同步時將執行單向強制更動。若你在其他裝置上做出的更動尚未同步至此裝置，請先同步後再更改。
deck-config-confirm-remove-name = 移除{ $name }？

## Other Buttons

deck-config-save-button = 儲存
deck-config-save-to-all-subdecks = 儲存至所有子牌組
deck-config-revert-button-tooltip = 將此設定回復為預設值。

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ 處理方式
deck-config-description-new-handling-hint = 以 Markdown 語言輸入，並清除 HTML 輸入。當啟用時，描述也會在恭喜畫面顯示。Markdown 在 Anki 2.1.40及以下版本將以純文字出現。

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    一個父牌組的上限為{ $cards ->
       *[other] { $cards } 張卡片
    }，此上限將被覆寫。
deck-config-reviews-too-low =
    若每天新增 { $cards ->
       *[other] { $cards } 張新卡片
    }，複習上限至少應為 { $expected }。
deck-config-learning-step-above-graduating-interval = 畢業間隔至少應該和最後一個學習階段一樣長。
deck-config-good-above-easy = 簡單間隔至少應該和畢業間隔一樣長。
deck-config-relearning-steps-above-minimum-interval = 最小忘記間隔至少應該和最後一個重新學習階段一樣長。
deck-config-maximum-answer-secs-above-recommended = 請儘量保持問題簡練，這樣 Anki 能更好為你排程複習。

## Selecting a deck

deck-config-which-deck = 請選擇牌組

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

deck-config-bury-new-siblings = 暫停新關聯卡片到下一天
deck-config-bury-review-siblings = 暫停複習關聯卡片到下一天
deck-config-bury-interday-learning-siblings = 暫停隔天學習的關聯卡片
deck-config-bury-new-tooltip = 啟用後，推遲同一則筆記中的其他`新卡片`（如反向卡片、相鄰的克漏字空格）到第二天。
deck-config-bury-review-tooltip = 啟用後，推遲同一則筆記中的其他`複習卡`到第二天。
deck-config-bury-interday-learning-tooltip = 啟用後，若同一則筆記中有其他卡片正在`學習中`，且學習間隔大於 1 天，則將它再推遲 1 天。
