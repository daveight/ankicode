# The date a card will be ready to review
statistics-due-date = Đến hạn
# The count of cards waiting to be reviewed
statistics-due-count = Đến hạn
# Shown in the Due column of the Browse screen when the card is a new card
statistics-due-for-new-card = Mới #{ $number }

## eg 16.8s (3.6 cards/minute)

statistics-cards-per-min = { $cards-per-minute } thẻ / phút
statistics-average-answer-time = { $average-seconds }s ({ statistics-cards-per-min })

## A span of time studying took place in, for example
## "(studied 30 cards) in 3 minutes"

statistics-in-time-span-seconds =
    { $amount ->
       *[other] trong { $amount } giây
    }
statistics-in-time-span-minutes =
    { $amount ->
       *[other] trong { $amount } phút
    }
statistics-in-time-span-hours =
    { $amount ->
       *[other] trong { $amount } giờ
    }
statistics-in-time-span-days =
    { $amount ->
       *[other] trong { $amount } ngày
    }
statistics-in-time-span-months =
    { $amount ->
       *[other] trong { $amount } tháng
    }
statistics-in-time-span-years =
    { $amount ->
       *[other] trong { $amount } năm
    }
statistics-cards = { $cards } thẻ
# a count of how many cards have been answered, eg "Total: 34 reviews"
statistics-reviews = { $reviews } thẻ ôn tập
# Shown at the bottom of the deck list, and in the statistics screen.
# eg "Studied 3 cards in 13 seconds today (4.33s/card)."
# The { statistics-in-time-span-seconds } part should be pasted in from the English
# version unmodified.
statistics-studied-today =
    Đã học { statistics-cards }
    { $unit ->
        [seconds] { statistics-in-time-span-seconds }
        [minutes] { statistics-in-time-span-minutes }
        [hours] { statistics-in-time-span-hours }
        [days] { statistics-in-time-span-days }
        [months] { statistics-in-time-span-months }
       *[years] { statistics-in-time-span-years }
    } hôm nay
    ({ $secs-per-card }giây/thẻ)
# eg, "Time taken to review card: 5s"
statistics-seconds-taken = { $seconds }giây
statistics-today-title = Hôm nay
statistics-today-again-count = Học lại:
statistics-today-type-counts = Học: { $learnCount }, Ôn: { $reviewCount }, Học lại: { $relearnCount }, Lọc: { $filteredCount }
statistics-today-no-cards = Không có thẻ nào đã được học hôm nay.
statistics-today-no-mature-cards = Chưa có thẻ trưởng thành học trong hôm nay.
statistics-today-correct-mature = Số trả lời đúng thẻ trưởng thành: { $correct }/{ $total } ({ $percent }%)
statistics-counts-total-cards = Tổng số thẻ
statistics-counts-new-cards = Mới
statistics-counts-young-cards = Trẻ
statistics-counts-mature-cards = Trưởng thành
statistics-counts-suspended-cards = Dừng
statistics-counts-buried-cards = Đã tạm hoãn
statistics-counts-filtered-cards = Đã lọc
statistics-counts-learning-cards = Đang học
statistics-counts-relearning-cards = Đang học lại
statistics-counts-title = Số lượng thẻ
statistics-counts-separate-suspended-buried-cards = Tách riêng thẻ đã ngừng/tạm hoãn
statistics-range-all-time = dòng đời bộ thẻ
statistics-range-1-year-history = 12 tháng trước
statistics-range-all-history = tất cả lịch sử
statistics-range-deck = bộ thẻ
statistics-range-collection = bộ sưu tập
statistics-range-search = Tìm
statistics-card-ease-title = Thẻ Dễ
statistics-card-ease-subtitle = Mức độ dễ càng thấp, thẻ sẽ xuất hiện càng thường xuyên.
# eg "3 cards with 150-170% ease"
statistics-card-ease-tooltip =
    { $cards ->
       *[other] { $cards } thẻ với { $percent } dễ
    }
statistics-future-due-title = Dự báo
statistics-future-due-subtitle = Số thẻ ôn tập đến hạn trong tương lai.
statistics-added-title = Đã thêm
statistics-added-subtitle = Số thẻ mới bạn đã thêm.
statistics-reviews-count-subtitle = Số câu hỏi đã trả lời.
statistics-reviews-time-subtitle = Thời gian trả lời câu hỏi.
statistics-answer-buttons-title = Nút Trả lời
# eg Button: 4
statistics-answer-buttons-button-number = Nút
# eg Times pressed: 123
statistics-answer-buttons-button-pressed = Số lần nhấn
statistics-answer-buttons-subtitle = Số lần nhấn mỗi nút.
statistics-reviews-title = Ôn tập
statistics-reviews-time-checkbox = Thời gian
statistics-in-days-single =
    { $days ->
        [0] Hôm nay
        [1] Ngày mai
       *[other] { $days } ngày nữa
    }
statistics-in-days-range = Trong khoảng { $daysStart }-{ $daysEnd } ngày nữa
statistics-days-ago-single =
    { $days ->
        [1] Hôm qua
       *[other] { $days } ngày trước
    }
statistics-days-ago-range = { $daysStart }-{ $daysEnd } ngày trước
statistics-running-total = Tổng thời gian học
statistics-cards-due =
    { $cards ->
       *[other] { $cards } thẻ đến hạn
    }
statistics-backlog-checkbox = Tồn đọng
statistics-intervals-title = Khoảng cách
statistics-intervals-subtitle = Thời gian giãn cách đến khi hiện thẻ ôn tập lần nữa
statistics-intervals-day-range =
    { $cards ->
       *[other] { $cards } thẻ có khoảng từ { $daysStart }~{ $daysEnd } ngày
    }
statistics-intervals-day-single =
    { $cards ->
       *[other] { $cards } thẻ trong khoảng { $day } ngày
    }
# hour range, eg "From 14:00-15:00"
statistics-hours-range = Từ { $hourStart }:00~{ $hourEnd }:00
statistics-hours-correct = { $correct }/{ $total } đúng ({ $percent }%)
statistics-hours-title = Chia nhỏ Theo giờ
statistics-hours-subtitle = Tỷ lệ ôn tập thành công mỗi giờ trong ngày
# shown when graph is empty
statistics-no-data = KHÔNG CÓ DỮ LIỆU
statistics-calendar-title = Lịch

## An amount of elapsed time, used in the graphs to show the amount of
## time spent studying. For example, English would show "5s" for 5 seconds,
## "13.5m" for 13.5 minutes, and so on.
##
## Please try to keep the text short, as longer text may get cut off.

statistics-elapsed-time-seconds = { $amount }s
statistics-elapsed-time-minutes = { $amount }m
statistics-elapsed-time-hours = { $amount }h
statistics-elapsed-time-days = { $amount }d
statistics-elapsed-time-months = { $amount }mo
statistics-elapsed-time-years = { $amount }y

##

statistics-average-for-days-studied = Số ngày trung bình đã học
statistics-total = Tổng
statistics-days-studied = Số ngày đã học
statistics-average-answer-time-label = Thời gian trả lời trung bình
statistics-average = Trung bình
statistics-average-interval = Khoảng cách trung bình
statistics-longest-interval = Khoảng lâu nhất
statistics-due-tomorrow = Đến hạn ngày mai
# eg 5 of 15 (33.3%)
statistics-amount-of-total-with-percentage = { $amount } trong { $total } ({ $percent }%)
statistics-average-over-period = Nếu học hàng ngày thì
statistics-reviews-per-day =
    { $count ->
       *[other] { $count } thẻ ôn tập/ngày
    }
statistics-minutes-per-day =
    { $count ->
       *[other] { $count } phút/ngày
    }
statistics-cards-per-day =
    { $count ->
       *[other] { $count } thẻ/ngày
    }
statistics-average-ease = Độ dễ trung bình
statistics-save-pdf = Lưu PDF
statistics-saved = Đã lưu.
statistics-stats = thống kê
