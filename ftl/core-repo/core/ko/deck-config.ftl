### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks = { $decks }개 덱에서 사용 중
deck-config-default-name = 기본
deck-config-title = 덱 옵션

## Daily limits section

deck-config-daily-limits = 일일 한도
deck-config-new-limit-tooltip =
    하루에 보여줄 새 카드의 최대 개수입니다.
    새로운 내용은 단기적인 복습량을 증가시키기 때문에
    최대 복습량보다 최소한 10배 이상 작아야 합니다.
deck-config-review-limit-tooltip =
    하루에 보여줄 최대 복습 카드 수입니다.
    복습할 카드가 있는 경우에 쓰입니다.
deck-config-limit-deck-v3 =
    하위 덱이 있는 덱을 공부할 때 하위 덱마다 설정한 최대치가
    각 덱에서 카드 몇 개를 뽑을지 결정합니다.
    상위 덱의 최대치는 보여줄 총 카드 개수를 결정합니다.
deck-config-limit-new-bound-by-reviews =
    최대 복습량은 새 카드 한도에 영향을 미칩니다. 예를 들어,
    최대 복습량이 200개로 설정되어 있고 현재 복습할 카드가 190개 있다면,
    새 카드는 최대 10개까지 표시됩니다. 최대 복습량에 도달한 경우
    새 카드는 표시되지 않습니다.
deck-config-limit-interday-bound-by-reviews = 복습한도는 interday 학습 카드에도 영향을 미칩니다. 한도를 적용할 때 interday 학습 카드를 먼저 가져오고, 그 다음 복습카드, 마지막으로 새카드를 가져옵니다.
deck-config-tab-description =
    - `사전 설정`: 사전 설정을 공유하는 모든 덱과 같은 최대치입니다.
    - `현재 덱`: 현재 덱에만 적용되는 최대치입니다.
    - `오늘만`: 일시적으로 적용되는 최대치입니다.

## Daily limit tabs: please try to keep these as short as the English version,
## as longer text will not fit on small screens.

deck-config-shared-preset = 사전 설정
deck-config-deck-only = 현재 덱
deck-config-today-only = 오늘만

## New Cards section

deck-config-learning-steps = 학습 단계
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = 복습간격은 일반적으로 분('1m') 또는 일('2d')이지만 시간('1h') 및 초('30s')도 지원됩니다.
deck-config-learning-steps-tooltip =
    여러 복습간격 사이에 공백을 넣어 입력하세요. 첫번째 복습간격은
    새 카드의 `다시` 버튼을 누를 때 사용되며 기본적으로 1분입니다.
    `알맞음` 버튼을 누르면 다음 단계로 진행되며 기본적으로 10분입니다.
    모든 단계를 통과하면 카드는 복습 카드가 되고
    다른 날에 나타날 것입니다. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip =
    마지막 학습 단계에서 `알맞음` 버튼을 누른 후 카드를
    다시 보여주기 전까지 기다리는 일수입니다.
deck-config-easy-interval-tooltip =
    건너뛰기 위해 학습 중 `쉬움` 버튼을 누른 후 카드를
    다시 보여주기 전까지 기다리는 일수입니다.
deck-config-new-insertion-order = 삽입 순서
deck-config-new-insertion-order-tooltip =
    새 카드를 추가할 때 어디에 넣을지(만기 순서)를 결정합니다.
    만기 순서가 더 낮은 카드부터 공부하게 됩니다. 이 옵션을
    변경하면 새 카드의 기존 위치가 자동으로 업데이트됩니다.
deck-config-new-insertion-order-sequential = 순차적 (오래된 카드부터)
deck-config-new-insertion-order-random = 랜덤
deck-config-new-insertion-order-random-with-v3 =
    V3 스케줄러를 쓰신다면 설정을 순차적으로 유지하되,
    새로운 카드의 수집 순서를 조정하는 걸 추천합니다.

## Lapses section

deck-config-relearning-steps = 복습 단계
deck-config-relearning-steps-tooltip =
    여러 복습간격 사이에 공백을 넣어 입력할 수 있어요. 기본적으로
    `다시` 버튼을 누르면 10분 뒤에 다시 보여줍니다. 만약 아무것도
    입력하지 않으면 카드는 재학습에 진입하지 않고
    복습주기만 바뀌게 됩니다. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    카드를 복습하는 도중 '다시' 버튼을 몇 번이나 눌러야 leech로 변하는지를
    나타냅니다. leech는 학습자의 시간을 지나치게 소비하는 카드로,
    다시 쓰거나 없애거나 연상을 돕는 줄임말 등을
    만들어 보는 걸 추천드립니다.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `태그만`: 노트에 leech 태그를 달고 팝업을 표시합니다.
    
    `카드 일시중단`: 노트에 태그를 붙이는 것 외에도 카드를
    직접 일시중단 해제할 때까지 숨깁니다.

## Burying section

deck-config-bury-title = 미루기

## Ordering section

deck-config-ordering-title = 표시 순서
deck-config-new-gather-priority = 새로운 카드의 수집 순서
deck-config-new-gather-priority-tooltip-2 =
    `덱`: 맨 위에 있는 덱부터 순서대로 카드를 수집합니다. 각 덱의 카드는
    오름차순으로 모이게 됩니다. 선택한 덱의 일일 최대 복습량에 도달하면 모든 덱을
    확인하기 전에 모으기가 중지될 수 있습니다. 이 방법은 컬렉션이 클수록 제일 빠르며,
    상단에 가까운 하위 덱이 우선되는 효과도 볼 수 있습니다.
    
    `오름차순`: 오름차순(만기 순서)로 카드를 모으는데, 이러면 대부분
    가장 오래된 카드가 먼저 추가됩니다.
    
    `내림차순`: 내림차순(마감 순서)로 카드를 모으는데, 이러면 대부분
    가장 최근의 카드가 먼저 추가됩니다.
    
    `랜덤 노트`: 임의로 선택한 노트의 카드를 모읍니다. 같은 노트에 있는 카드 미루기가
    비활성화되어있다면, 한 세션에서 노트의 모든 카드가 등장할 수도 있습니다.
    (예를 들어, 앞면->뒷면과 뒷면->앞면 카드 모두)
    
    `랜덤 카드`: 무작위으로 카드를 모읍니다.
deck-config-new-gather-priority-deck = 덱
deck-config-new-gather-priority-position-lowest-first = 오름차순
deck-config-new-gather-priority-random-notes = 랜덤 노트
deck-config-new-gather-priority-random-cards = 랜덤 카드
deck-config-new-card-sort-order = 새로운 카드의 정렬 순서
deck-config-new-card-sort-order-tooltip-2 =
    `카드 유형`: 카드 유형 번호 순서대로 카드를 표시합니다. 인접한 카드 미루기를
    비활성화한 경우, 모든 앞면→ 뒷면 카드가 뒷면→ 앞면 카드보다 먼저 표시됩니다.
    한 세션에 동일한 노트의 모든 카드를 표시하되 서로 너무 가깝지 않도록
    하고 싶을 때 유용합니다.
    
    `수집 순서`: 카드가 수집된 그대로 표시됩니다. 인접한 카드 미루기를
    비활성화한 경우, 일반적으로 노트의 모든 카드가 차례로 표시됩니다.
    
    `카드 유형 후 랜덤`: 카드 유형처럼 카드 유형 번호 순서대로 카드를 섞습니다.
    `오름차순`으로 가장 오래된 카드를 수집했다면 카드가 무작위로 나타나되
    동일한 노트의 카드가 서로 너무 가깝지 않도록 할 수 있습니다.
    
    `랜덤 노트 후 카드 유형`: 랜덤으로 노트를 고른 후 인접한 모든 카드를
    순서대로 보여줍니다.
    
    `랜덤`: 수집된 카드를 완전히 뒤섞습니다.
deck-config-sort-order-card-template-then-random = 카드 유형 후 랜덤
deck-config-sort-order-random-note-then-template = 랜덤 노트 후 카드 유형
deck-config-sort-order-random = 랜덤
deck-config-sort-order-template-then-gather = 카드 유형
deck-config-sort-order-gather = 수집 순서
deck-config-new-review-priority = 새/복습 카드 순서
deck-config-new-review-priority-tooltip = 복습 카드 대비 새 카드를 보여줄 시기를 나타냅니다.
deck-config-interday-step-priority = interday 학습카드/복습카드 순서
deck-config-interday-step-priority-tooltip =
    하루의 경계를 넘는(interday) 학습카드/복습카드를 보여줄 시기를 나타냅니다.
    
    복습 한도는 항상 interday 학습 카드에 먼저 적용되고, 그 다음에
    복습 카드에 적용됩니다. 이 옵션은 수집된 카드가 표시되는 순서를
    바꿀 수 있지만, interday 학습 카드가 항상 먼저 수집됩니다.
deck-config-review-mix-mix-with-reviews = 복습 카드와 섞기
deck-config-review-mix-show-after-reviews = 복습한 뒤에 표시
deck-config-review-mix-show-before-reviews = 복습하기 전에 표시
deck-config-review-sort-order = 복습 정렬 순서
deck-config-review-sort-order-tooltip =
    기본 순서는 가장 오래 기다린 카드를 먼저 보여줍니다.
    그래서 복습을 밀리면 가장 오래된 카드가 먼저 나타납니다.
    따라잡는 데 며칠이 걸리거나 카드를 하위 덱 순서대로
    보려면 다른 정렬 순서를 사용하는 걸 추천합니다.
deck-config-sort-order-due-date-then-random = 만기 날짜 후 랜덤
deck-config-sort-order-due-date-then-deck = 만기 날짜 후 덱
deck-config-sort-order-deck-then-due-date = 덱 후 만기 날짜
deck-config-sort-order-ascending-intervals = 복습간격이 짧은 것부터
deck-config-sort-order-descending-intervals = 복습간격이 긴 것부터
deck-config-sort-order-ascending-ease = ease 오름차순
deck-config-sort-order-relative-overdueness = 늦은 정도의 상대값
deck-config-display-order-will-use-current-deck =
    Anki는 하위 덱이 아닌 사용자가
    학습할 덱의 표시 순서를 사용합니다.

## Timer section

deck-config-timer-title = 타이머
deck-config-maximum-answer-secs = 답할 최대 시간
deck-config-maximum-answer-secs-tooltip =
    한 카드를 학습할 때 주어진 최대 시간(초)입니다.
    잠시 쉬느라 응답하는 데 시간을 넘겼다면,
    소요 시간은 설정된 최대치로 기록됩니다.
deck-config-show-answer-timer-tooltip = 학습할 때 각 카드마다 걸리는 시간(초)을 기록하는 타이머를 표시합니다.

## Audio section

deck-config-audio-title = 오디오
deck-config-disable-autoplay = 오디오 자동 재생 끄기
deck-config-disable-autoplay-tooltip =
    활성화하면 Anki가 오디오를 자동으로 재생하지 않습니다.
    오디오 아이콘을 클릭/탭하거나 오디오 재생 동작으로 수동으로 재생할 수 있습니다.
deck-config-skip-question-when-replaying = 답변 재생할 때 질문 건너뛰기
deck-config-always-include-question-audio-tooltip = 카드의 답을 확인하면서 재생 동작을 사용할 때 질문 오디오도 재생해야 하는지를 나타냅니다.

## Advanced section

deck-config-advanced-title = 고급
deck-config-maximum-interval-tooltip =
    복습카드가 기다릴 최대 일수입니다. 최대 복습주기에 다다르면
    `어려움`, `알맞음`, `쉬움` 어느 것이든 동일한 복습주기를 나타냅니다.
    짧게 설정할수록 공부량이 늘어납니다.
deck-config-starting-ease-tooltip =
    새 카드가 처음에 가질 ease 값입니다. 기본적으로, 새로운 카드에 `알맞음`
    버튼을 누르면 다음 복습간격은 직전 복습간격의 2.5배가 됩니다.
deck-config-easy-bonus-tooltip = 카드를 '쉬움'으로 평가할 때 복습 카드의 주기에 적용되는 추가적인 승수입니다.
deck-config-interval-modifier-tooltip =
    이 승수는 모든 학습에 적용되며, 조금씩 바꾸면 Anki의 일정이
    느슨하게 또는 빡빡하게 조정될 수 있습니다. 이 옵션을
    변경하기 전에 설명서를 참조하시기 바랍니다.
deck-config-hard-interval-tooltip = 카드를 '어려움'으로 평가할 때 복습 카드의 주기에 적용되는 승수입니다.
deck-config-new-interval-tooltip = 카드를 '다시'로 평가할 때 복습 카드의 주기에 적용되는 승수입니다.
deck-config-minimum-interval-tooltip = 카드를 '다시'로 평가할 때 복습 카드에 적용할 최소한의 주기입니다.
deck-config-custom-scheduling = 사용자 정의 스케줄링
deck-config-custom-scheduling-tooltip = 컬렉션 전체에 영향을 미칩니다. 위험을 인지하고 사용하시기 바랍니다!

## Adding/renaming

deck-config-add-group = 사전 설정 추가
deck-config-name-prompt = 이름
deck-config-rename-group = 사전 설정 이름 변경
deck-config-clone-group = 사전 설정 복제

## Removing

deck-config-remove-group = 사전 설정 제거
deck-config-will-require-full-sync =
    요청한 변경 사항을 적용하려면 단방향 동기화가 필요합니다. 다른 장치에서
    변경한 내용을 이 장치에 아직 동기화하지 않은 경우, 계속하기 전에
    먼저 동기화를 하시기 바랍니다.
deck-config-confirm-remove-name = { $name }를 제거하시겠습니까?

## Other Buttons

deck-config-save-button = Save
deck-config-save-to-all-subdecks = 모든 하위 덱에 저장
deck-config-revert-button-tooltip = 이 설정을 기본값으로 복원

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = Anki 2.1.41+ 다루기
deck-config-description-new-handling-hint =
    입력을 마크다운으로 처리하고 HTML 입력을 정리합니다. 활성화하면
    설명이 축하 화면에도 나타납니다.
    Anki 2.1.40 이하에서 마크다운은 텍스트로 보입니다.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped = 상위 덱이 { $cards }개로 이 최대치를 넘어섭니다.
deck-config-reviews-too-low = 만약 매일 새로운 카드 { $cards }개를 추가한다면, 복습 최대치는 적어도 { $expected }개가 되어야 합니다.
deck-config-learning-step-above-graduating-interval = 졸업 주기는 적어도 최종 학습 간격만큼은 되어야 합니다.
deck-config-good-above-easy = 쉬움 주기는 적어도 졸업 주기만큼은 되어야 합니다.
deck-config-relearning-steps-above-minimum-interval = 최소 반복 주기는 적어도 최종 복습 간격만큼은 되어야 합니다.
deck-config-maximum-answer-secs-above-recommended = Anki는 각 질문이 짧을수록 리뷰 일정을 더 효율적으로 잡을 수 있습니다.

## Selecting a deck

deck-config-which-deck = 어떤 덱을 고르시겠습니까?

## NO NEED TO TRANSLATE. This text is no longer used by Anki, and will be removed in the future.

deck-config-bury-new-siblings = 같은 노트에 있는 새 카드 미루기
deck-config-bury-review-siblings = 같은 노트에 있는 복습카드 미루기
deck-config-bury-new-tooltip =
    동일한 노트의 다른 (역방향, 인접한 빈칸 채우기 등) `새` 카드를
    다음 날까지 미룰지 여부를 나타냅니다.
deck-config-bury-review-tooltip = 동일한 노트의 다른 `복습` 카드를 다음 날까지 미룰지 여부를 나타냅니다.
deck-config-bury-interday-learning-tooltip =
    주기가 하루 이상인 동일한 노트의 다른 `학습` 카드를
    다음 날까지 미룰지 여부를 나타냅니다.
