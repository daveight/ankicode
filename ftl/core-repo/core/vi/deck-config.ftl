### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    được sử dụng bởi { $decks ->
       *[other] bộ bài
    }
deck-config-default-name = Mặc định
deck-config-title = Tùy chỉnh Bộ bài

## Daily limits section

deck-config-daily-limits = Giới hạn hàng ngày
deck-config-new-limit-tooltip =
    Số lượng thẻ mới tối đa xuất ra trong một ngày, nếu có thẻ mới.
    Bởi vì tài liệu mới sẽ làm tăng khối lượng công việc ôn tập ngắn hạn của bạn, điều này thường nên ít nhất 10 lần ít hơn so với giới hạn ôn tập của bạn.
deck-config-review-limit-tooltip =
    Số lượng thẻ ôn tập tối đa để hiển thị trong một ngày,
    nếu thẻ đã sẵn sàng để ôn tập.
deck-config-limit-deck-v3 =
    Khi học một bộ bài có Tập con chứa bên trong nó, giới hạn đặt trên mỗi
    Tập con điều chỉnh số Thẻ tối đa được rút ra từ bộ bài cụ thể đó.
    Giới hạn của bộ bài được chọn điều chỉnh tổng số Thẻ sẽ xuất hiện.
deck-config-limit-new-bound-by-reviews =
    Giới hạn ôn tập ảnh hưởng đến giới hạn mới. Ví dụ, nếu giới hạn xem xét của bạn là
    đặt thành 200 và bạn có 190 thẻ ôn tập đang chờ, tối đa 10 thẻ mới sẽ
    được giới thiệu. Nếu bạn đã đạt đến giới hạn ôn tập, sẽ không có thẻ mới
    được xem.
deck-config-limit-interday-bound-by-reviews = Giới hạn ôn tập cũng sẽ áp dụng cho những thẻ cần học trong ngày. Khi áp dụng giới hạn, hệ thống sẽ hiển thị thẻ trong ngày trước, sau đó ôn lại, và cuối cùng là những thẻ mới.

## New Cards section

deck-config-learning-steps = Bước học
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = Độ trễ thường là phút (vd `1m`) hoặc ngày (vd: `2d`), nhưng giờ (vd `1h`) và giây (vd`30s`) cũng được hỗ trợ.
deck-config-learning-steps-tooltip =
    Một hoặc nhiều lần trì hoãn, được phân tách bằng dấu cách. Thời gian trễ đầu tiên sẽ được sử dụng
    khi bạn nhấn nút `Lại` trên thẻ mới, và theo mặc định là 1 phút.
    Nút `Tốt` sẽ chuyển sang bước tiếp theo, theo mặc định là 10 phút.
    Khi tất cả các bước đã được thông qua, thẻ này sẽ trở thành một thẻ ôn tập, và
    sẽ xuất hiện vào một ngày khác. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip =
    Số ngày phải chờ trước khi hiển thị lại thẻ, sau khi nút `Tốt`
    được nhấn vào bước học cuối cùng.
deck-config-easy-interval-tooltip =
    Số ngày phải chờ trước khi hiển thị lại thẻ, sau khi nút `Dễ`
    được sử dụng để xóa ngay một thẻ khỏi quá trình học.
deck-config-new-insertion-order = Lệnh chèn
deck-config-new-insertion-order-tooltip =
    Kiểm soát vị trí (do #) thẻ mới được chỉ định khi bạn thêm thẻ mới.
    Các thẻ có số đến hạn thấp hơn sẽ được hiển thị đầu tiên khi học. Thay đổi
    tùy chọn này sẽ tự động cập nhật vị trí hiện có của các thẻ mới.
deck-config-new-insertion-order-sequential = Tuần tự (thẻ cũ nhất trước)
deck-config-new-insertion-order-random = Ngẫu nhiên

## Lapses section

deck-config-relearning-steps = Bước học lại
deck-config-relearning-steps-tooltip =
    Độ trễ bằng 0 hoặc nhiều hơn, được phân tách bằng dấu cách. Theo mặc định, nhấn nút `Lại`
    trên thẻ ôn tập sẽ hiển thị lại sau 10 phút. Nếu không có sự chậm trễ
    xen vào, thẻ sẽ thay đổi khoảng thời gian, mà không cần nhập
    phân chia lại. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    Số lần `Lại` cần được nhấn vào thẻ ôn tập trước khi nó được
    được đánh dấu là một con đỉa. Đỉa là loại thẻ ngốn rất nhiều thời gian của bạn, và
    khi một thẻ được đánh dấu là một con đỉa, bạn nên viết lại nó, xóa nó, hoặc
    nghĩ ra một phương pháp ghi nhớ để giúp bạn nhớ nó.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `Chỉ Nhãn`: Thêm nhãn "đỉa" vào phiếu và hiển thị cửa sổ bật lên.
    
    `Ngừng Thẻ`: Ngoài việc gắn nhãn cho phiếu, hãy ẩn thẻ cho đến khi nó
    không bị tạm dừng theo cách thủ công.

## Burying section

deck-config-bury-title = Đang tạm hoãn
deck-config-bury-new-siblings = Hoãn các thẻ anh em của thẻ mới cho tới ngày tiếp theo
deck-config-bury-review-siblings = Hoãn các thẻ anh em của thẻ ôn tập cho tới ngày tiếp theo
deck-config-bury-tooltip =
    Cho dù các thẻ khác cùng phiếu (vd các thẻ đảo, liền kề
    với khoảng điền) sẽ bị trì hoãn cho đến ngày hôm sau.

## Ordering section

deck-config-ordering-title = Thứ tự hiển thị
deck-config-new-gather-priority = Ưu tiên nhóm thẻ mới
deck-config-new-gather-priority-tooltip =
    `Bộ thẻ`: tập hợp các thẻ từ mỗi bộ thẻ con theo thứ tự và dừng khi
    giới hạn của bộ thẻ được chọn bị vượt quá. Như vậy sẽ nhanh hơn và cho phép bạn
    sắp xếp ưu tiên các bộ thẻ con gần đầu hơn.
    
    `Vị trí`: tập hợp các thẻ từ tất cả các bộ thẻ trước khi chúng được sắp xếp. Điều này
    đảm bảo các thẻ xuất hiện ở vị trí cố định (do #) thứ tự, ngay cả khi giới hạn mẹ là
    không đủ cao để xem các thẻ từ tất cả các bộ thẻ.
deck-config-new-gather-priority-deck = Bộ thẻ
deck-config-new-gather-priority-position-lowest-first = Vị trí tăng dần
deck-config-new-gather-priority-position-highest-first = Vị trí giảm dần
deck-config-new-card-sort-order = Thứ tự sắp xếp thẻ mới
deck-config-new-card-sort-order-tooltip =
    Cách các thẻ được sắp xếp sau khi chúng được tập hợp. Theo mặc định, Anki sắp xếp
    theo mẫu thẻ trước, để tránh nhiều thẻ của cùng một phiếu giống nhau
    xuất hiện nối tiếp nhau.
deck-config-sort-order-card-template-then-lowest-position = Theo mẫu thẻ, sau đó là vị trí tăng dần
deck-config-sort-order-card-template-then-highest-position = Theo mẫu thẻ, sau đó là vị trí giảm dần
deck-config-sort-order-card-template-then-random = Mẫu thẻ, sau đó là ngẫu nhiên
deck-config-sort-order-lowest-position = Vị trí tăng dần
deck-config-sort-order-highest-position = Vị trí giảm dần
deck-config-sort-order-random = Ngẫu nhiên
deck-config-sort-order-template-then-gather = Theo mẫu thẻ, rồi đến thứ tự tập hợp thẻ
deck-config-sort-order-gather = Theo thứ tự tập hợp thẻ
deck-config-new-review-priority = Ưu tiên thẻ mới/ôn tập
deck-config-new-review-priority-tooltip = Thời điểm hiển thị thẻ mới liên quan đến thẻ ôn tập.
deck-config-interday-step-priority = Ưu tiên học/ôn tập trong ngày
deck-config-interday-step-priority-tooltip = Khi nào hiển thị (lại) các thẻ học tập vượt qua ranh giới trong ngày.
deck-config-review-mix-mix-with-reviews = Trộn các thẻ ôn tập
deck-config-review-mix-show-after-reviews = Xem sau các thẻ ôn tập
deck-config-review-mix-show-before-reviews = Xem trước các thẻ ôn tập
deck-config-review-sort-order = Xem lại thứ tự sắp xếp
deck-config-review-sort-order-tooltip =
    Thứ tự mặc định ưu tiên các thẻ bị xếp vào hàng đợi lâu nhất, do đó
    Nếu bạn có bị tồn đọng thẻ ôn tập, những hàng đợi lâu nhất sẽ xuất hiện
    đầu tiên. Nếu bạn có một lượng lớn tồn đọng sẽ mất hơn vài ngày để giải quyết
    sạch sẽ, hoặc nếu muốn xem các thẻ theo thứ tự bộ thẻ con, bạn có thể tìm thẻ thay thế
    sắp xếp thứ tự thích hợp.
deck-config-sort-order-due-date-then-random = Theo ngày đến hạn, sau đó ngẫu nhiên
deck-config-sort-order-due-date-then-deck = Theo ngày đến hạn, sau đó theo bộ thẻ
deck-config-sort-order-deck-then-due-date = Theo bộ thẻ, sau đó theo ngày đến hạn
deck-config-sort-order-ascending-intervals = Theo khoảng cách tăng dần
deck-config-sort-order-descending-intervals = Theo khoảng cách giảm dần
deck-config-sort-order-ascending-ease = Bội số tăng dần
deck-config-sort-order-descending-ease = Bội số giảm dần
deck-config-display-order-will-use-current-deck =
    Anki sẽ sử dụng thứ tự hiển thị từ bộ thẻ mà bạn
    chọn để học, chứ không phải bất kỳ bộ thẻ con có thể có nào khác.

## Timer section

deck-config-timer-title = Bộ hẹn giờ
deck-config-maximum-answer-secs = Số giây trả lời tối đa
deck-config-maximum-answer-secs-tooltip =
    Số giây tối đa được ghi lại cho một thẻ ôn tập đơn. Nếu một câu trả lời
    vượt quá thời gian này (vì bạn đã thoát ra khỏi màn hình chẳng hạn), 
    thời gian thực hiện sẽ được ghi lại dưới dạng giới hạn bạn đã đặt.
deck-config-show-answer-timer-tooltip =
    Trong màn hình xem lại, hiển thị bộ đếm số giây bạn
    ôn tập từng thẻ.

## Audio section

deck-config-audio-title = Âm thanh
deck-config-disable-autoplay = Không tự động phát âm thanh
deck-config-skip-question-when-replaying = Bỏ qua câu hỏi khi phát lại câu trả lời
deck-config-always-include-question-audio-tooltip =
    Liệu câu hỏi dạng âm thanh có nên được đưa vào khi tác vụ Phát lại
    được sử dụng hay không trong lúc nhìn vào mặt trả lời của thẻ.

## Advanced section

deck-config-advanced-title = Nâng cao
deck-config-maximum-interval-tooltip =
    Số ngày tối đa mà một thẻ ôn tập sẽ đợi. Khi các thẻ ôn tập
    đạt đến giới hạn, `Khó`, `Tốt` và `Dễ` đều sẽ có cùng độ trễ .
    Bạn đặt càng ngắn, khối lượng công việc của bạn sẽ càng lớn.
deck-config-starting-ease-tooltip =
    Thẻ mới bắt đầu với bội số dễ. Theo mặc định, nút `Tốt` trên một
    thẻ mới đã học sẽ hoãn lần ôn tập tiếp theo gấp 2,5 lần độ trễ trước đó.
deck-config-easy-bonus-tooltip =
    Một bội số bổ sung được áp dụng cho khoảng thời gian của thẻ ôn tập khi bạn xếp 
    chúng vào `Dễ`.
deck-config-interval-modifier-tooltip =
    Bội số này được áp dụng cho tất cả các thẻ ôn tập và các điều chỉnh thứ cấp có thể được sử dụng 
    để làm cho Anki thận trọng hơn hoặc tích cực hơn trong việc tự lập lịch trình. Vui lòng xem
    hướng dẫn sử dụng trước khi thay đổi tùy chọn này.
deck-config-hard-interval-tooltip = Cấp số được áp dụng cho một khoảng thời gian ôn tập khi trả lời `Khó`.
deck-config-new-interval-tooltip = Cấp số được áp dụng cho một khoảng thời gian ôn tập khi trả lời `Lại`.
deck-config-minimum-interval-tooltip = Khoảng thời gian tối thiểu được cung cấp cho thẻ ôn tập sau khi trả lời `Lại '.
deck-config-custom-scheduling = Tùy chỉnh lên lịch
deck-config-custom-scheduling-tooltip = Ảnh hưởng đến toàn bộ bộ sưu tập. Sử dụng bạn sẽ có nguy cơ gặp rủi ro!

## Adding/renaming

deck-config-add-group = Thêm nhóm trước
deck-config-name-prompt = Tên
deck-config-rename-group = Đổi tên nhóm trước
deck-config-clone-group = Nhân đôi nhóm trước

## Removing

deck-config-remove-group = Xóa nhóm trước
deck-config-confirm-normal = Xóa { $name }?
deck-config-will-require-full-sync = Thao tác thay đổi này yêu cầu tải lên toàn bộ cơ sở dữ liệu trong lần đồng bộ bộ sưu tập kế tiếp. Nếu bạn có phần ôn tập hoặc thay đổi khác trên thiết bị khác chưa được đồng bộ thì chúng sẽ bị mất.
deck-config-confirm-remove-name = Xóa { $name }?

## Other Buttons

deck-config-save-button = Lưu
deck-config-save-to-all-subdecks = Lưu vào mọi Tập con
deck-config-revert-button-tooltip = Khôi phục cài đặt gốc.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ Chuyển hướng
deck-config-description-new-handling-hint =
    Xử lý đầu vào như đánh dấu và làm sạch đầu vào HTML. Khi được bật, các
    mô tả cũng sẽ được hiển thị trên màn hình chào mừng.
    Đánh dấu sẽ xuất hiện dưới dạng văn bản trên bản Anki 2.1.40 trở xuống.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Bộ bài mẹ có giới hạn là { $cards ->
       *[other] { $cards } thẻ
    }sẽ ghi đè lên giới hạn này.
deck-config-reviews-too-low =
    Nếu thêm{ $cards ->
       *[other] thẻ mới mỗi ngày
    }, giới hạn ôn tập nên đặt ít nhất
deck-config-learning-step-above-graduating-interval = Khoảng thời gian hoàn thành ít nhất phải dài bằng bước học cuối cùng của bạn.
deck-config-good-above-easy = Khoảng thời gian dễ ít nhất phải dài bằng khoảng thời gian hoàn thành.
deck-config-relearning-steps-above-minimum-interval = Khoảng thời gian trôi đi tối thiểu ít nhất phải dài bằng bước học lại cuối cùng của bạn.

## Selecting a deck

deck-config-which-deck = Bạn muốn bộ thẻ nào?
