# The date a card will be ready to review
statistics-due-date = 到期日期
# The count of cards waiting to be reviewed
statistics-due-count = 已到期
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = 新 #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } 張卡片/分鐘
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
       *[other] { $amount } 秒
    }
statistics-in-time-span-minutes =
    { $amount ->
       *[other] { $amount } 分鐘
    }
statistics-in-time-span-hours =
    { $amount ->
       *[other] { $amount } 小時
    }
statistics-in-time-span-days =
    { $amount ->
       *[other] { $amount } 天
    }
statistics-in-time-span-months =
    { $amount ->
       *[other] { $amount } 個月
    }
statistics-in-time-span-years =
    { $amount ->
       *[other] { $amount } 年
    }
statistics-cards = { $cards } 張卡片
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews = { $reviews } 張複習卡
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    今天學習了 { statistics-cards }，共花費 { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    }（平均每張卡片花費 { $secs-per-card } 秒）
statistics-today-title = 今天
statistics-today-again-count = 按下「重來」的次數：
statistics-today-type-counts = 新學習：{ $learnCount } 張 ‧ 複習：{ $reviewCount } 張 ‧ 重新學習：{ $relearnCount } 張 ‧ 篩選學習：{ $filteredCount } 張
statistics-today-no-cards = 今天尚未學習任何卡片
statistics-today-no-mature-cards = 今天沒有學習熟練卡片
statistics-today-correct-mature = 熟練卡片回答正確率：{ $correct }/{ $total }（{ $percent }%）
statistics-counts-total-cards = 總計
statistics-counts-new-cards = 新卡片
statistics-counts-young-cards = 未熟練
statistics-counts-mature-cards = 熟練
statistics-counts-suspended-cards = 已擱置
statistics-counts-buried-cards = 已暫停
statistics-counts-filtered-cards = 篩選
statistics-counts-learning-cards = 學習中
statistics-counts-relearning-cards = 重新學習中
statistics-counts-title = 卡片數量
statistics-counts-separate-suspended-buried-cards = 分開統計擱置/暫停的卡片
statistics-range-all-time = 不限時間
statistics-range-1-year-history = 過去 12 個月
statistics-range-all-history = 所有記錄
statistics-range-deck = 牌組統計
statistics-range-collection = 集合統計
statistics-range-search = 搜尋條件
statistics-card-ease-title = 卡片輕鬆度
statistics-card-ease-subtitle = 卡片的輕鬆度越低，出現的頻率就越高
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
       *[other] 有 { $cards } 張卡片的輕鬆度為 { $percent }
    }
statistics-future-due-title = 將來到期
statistics-future-due-subtitle = 將在未來到期的複習卡數量
statistics-added-title = 新增
statistics-added-subtitle = 新增卡片的數量
statistics-reviews-count-subtitle = 答題數量
statistics-reviews-time-subtitle = 答題所花時間
statistics-answer-buttons-title = 回答按鈕
# eg Button: 4
statistics-answer-buttons-button-number = 按鈕
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = 按下的次數
statistics-answer-buttons-subtitle = 按下各按鈕的次數
statistics-reviews-title = 複習
statistics-reviews-time-checkbox = 時間
statistics-in-days-single =
    { $days ->
        [0] 今天
        [1] 明天
       *[other] { $days } 天後
    }
statistics-in-days-range = { $daysStart }-{ $daysEnd } 天後
statistics-days-ago-single =
    { $days ->
        [1] 昨天
       *[other] { $days } 天前
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } 天前
statistics-running-total = 計算加總
statistics-cards-due =
    { $cards ->
       *[other] 將有 { $cards } 張卡片到期
    }
statistics-backlog-checkbox = 積壓卡片
statistics-intervals-title = 複習間隔
statistics-intervals-subtitle = 複習卡再次出現前的延遲
statistics-intervals-day-range =
    { $cards ->
       *[other] { $cards } 張間隔為 { $daysStart }~{ $daysEnd } 天的卡片
    }
statistics-intervals-day-single =
    { $cards ->
       *[other] { $cards } 張間隔為 { $day } 天的卡片
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = 正確率： { $correct }/{ $total } ({ $percent }%)
statistics-hours-title = 分時解析
statistics-hours-subtitle = 在一天中各個時間段所複習的成功率
# shown when graph is empty
statistics-no-data = 沒有資料
statistics-calendar-title = 年曆

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount } 秒
statistics-elapsed-time-minutes = { $amount } 分
statistics-elapsed-time-hours = { $amount } 時
statistics-elapsed-time-days = { $amount } 天
statistics-elapsed-time-months = { $amount } 個月
statistics-elapsed-time-years = { $amount } 年

##

statistics-average-for-days-studied = 平均（只計算實際學習天數）
statistics-total = 總計
statistics-days-studied = 學習天數
statistics-average-answer-time-label = 平均答題時間
statistics-average = 平均
statistics-average-interval = 平均間隔
statistics-due-tomorrow = 明天到期
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount }/{ $total } ({ $percent }%)
statistics-average-over-period = 平均（包含沒有學習的天數）
statistics-reviews-per-day =
    { $count ->
       *[other] { $count } 次複習/天
    }
statistics-minutes-per-day =
    { $count ->
       *[other] { $count } 分鐘/天
    }
statistics-cards-per-day =
    { $count ->
       *[other] { $count } 張卡片/天
    }
statistics-average-ease = 平均輕鬆度
statistics-save-pdf = 儲存為 PDF 檔
statistics-saved = 已儲存。
statistics-stats = 統計
