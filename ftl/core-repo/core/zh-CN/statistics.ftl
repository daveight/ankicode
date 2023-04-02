# The date a card will be ready to review
statistics-due-date = 到期
# The count of cards waiting to be reviewed
statistics-due-count = 到期
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = 新卡片 #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } 卡片/分钟
statistics-average-answer-time = { $average-seconds } 秒 ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds = { $amount }秒内
statistics-in-time-span-minutes = { $amount }分内
statistics-in-time-span-hours = { $amount }小时内
statistics-in-time-span-days = { $amount }天内
statistics-in-time-span-months = { $amount }个月内
statistics-in-time-span-years = { $amount }年内
statistics-cards = { $cards }张卡片
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews = { $reviews } 次复习
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    今天在 { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    }学习了 { statistics-cards } （每张卡片 { $secs-per-card } 秒）
statistics-today-title = 今天
statistics-today-again-count = 「重来」计数:
statistics-today-type-counts = 学习: { $learnCount }, 复习: { $reviewCount }, 重新学习: { $relearnCount }, 已筛选: { $filteredCount }
statistics-today-no-cards = 今天尚未学习任何卡片。
statistics-today-no-mature-cards = 今天没有学习熟练卡片。
statistics-today-correct-mature = 回答正确的熟练卡片：{ $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = 总计
statistics-counts-new-cards = 未学习
statistics-counts-young-cards = 欠熟练
statistics-counts-mature-cards = 已熟练
statistics-counts-suspended-cards = 已暂停
statistics-counts-buried-cards = 已搁置
statistics-counts-filtered-cards = 已筛选
statistics-counts-learning-cards = 学习中
statistics-counts-relearning-cards = 重学中
statistics-counts-title = 卡片数量
statistics-counts-separate-suspended-buried-cards = 分开统计暂停/搁置的卡片
statistics-range-all-time = 全部时间
statistics-range-1-year-history = 近一年
statistics-range-all-history = 全部
statistics-range-deck = 牌组
statistics-range-collection = 集合
statistics-range-search = 搜索
statistics-card-ease-title = 卡片简易度
statistics-card-ease-subtitle = 卡片简易度越低，其出现频率越高。
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
       *[other] { $cards }张简易度为{ $percent }的卡片
    }
statistics-future-due-title = 预测
statistics-future-due-subtitle = 将来到期的复习的数目
statistics-added-title = 新增
statistics-added-subtitle = 新增的卡片数量。
statistics-reviews-count-subtitle = 已经回答的问题的数量。
statistics-reviews-time-subtitle = 答题用时
statistics-answer-buttons-title = 回答按钮
# eg Button: 4
statistics-answer-buttons-button-number = 按钮
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = 按键次数
statistics-answer-buttons-subtitle = 按下每个按钮的次数.
statistics-reviews-title = 复习次数
statistics-reviews-time-checkbox = 用时
statistics-in-days-single =
    { $days ->
        [0] 今天
        [1] 明天
       *[other] { $days }天内
    }
statistics-in-days-range = { $daysStart }－{ $daysEnd }天内
statistics-days-ago-single =
    { $days ->
        [1] 昨天
       *[other] { $days }天前
    }
statistics-days-ago-range = { $daysStart }－{ $daysEnd }天前
statistics-running-total = 累计
statistics-cards-due =
    { $cards ->
       *[other] { $cards } 张卡片到期
    }
statistics-backlog-checkbox = 积压
statistics-intervals-title = 复习间隔
statistics-intervals-subtitle = 复习卡片再次出现前的间隔。
statistics-intervals-day-range =
    { $cards ->
       *[other] { $cards }张间隔为{ $daysStart }~{ $daysEnd }天的卡片
    }
statistics-intervals-day-single =
    { $cards ->
       *[other] { $cards }张间隔为{ $day }天的卡片
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = { $hourStart }时~{ $hourEnd }时
statistics-hours-correct = { $correct }/{ $total } 正确 ({ $percent }%)
statistics-hours-title = 逐小时分析
statistics-hours-subtitle = 当天逐小时的复习成功率。
# shown when graph is empty
statistics-no-data = 无数据
statistics-calendar-title = 日程表

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }秒
statistics-elapsed-time-minutes = { $amount }分
statistics-elapsed-time-hours = { $amount }小时
statistics-elapsed-time-days = { $amount }天
statistics-elapsed-time-months = { $amount }个月
statistics-elapsed-time-years = { $amount }年

##

statistics-average-for-days-studied = 平均值（只计实际学习天数）
statistics-total = 总计
statistics-days-studied = 学习天数
statistics-average-answer-time-label = 平均作答用时
statistics-average = 平均
statistics-average-interval = 平均间隔
statistics-due-tomorrow = 明天到期
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount }/{ $total }({ $percent }%)
statistics-average-over-period = 平均值 (包含未学习天数)
statistics-reviews-per-day =
    { $count ->
       *[other] { $count }次复习/天
    }
statistics-minutes-per-day =
    { $count ->
       *[other] { $count }分钟/天
    }
statistics-cards-per-day =
    { $count ->
       *[other] { $count }张卡片/天
    }
statistics-average-ease = 平均简易度
statistics-save-pdf = 保存PDF
statistics-saved = 已保存。
statistics-stats = 统计
