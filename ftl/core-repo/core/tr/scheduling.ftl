## The next time a card will be shown, in a short form that will fit
## on the answer buttons. For example, English shows "4d" to
## represent the card will be due in 4 days, "3m" for 3 minutes, and
## "5mo" for 5 months.


## A span of time, such as the delay until a card is shown again, the
## amount of time taken to answer a card, and so on. It is used by itself,
## such as in the Interval column of the browse screen,
## and labels like "Total Time" in the card info screen.

scheduling-time-span-seconds =
    { $amount ->
        [one] { $amount } saniye
       *[other] { $amount } saniye
    }
scheduling-time-span-minutes =
    { $amount ->
        [one] { $amount } dakika
       *[other] { $amount } dakika
    }
scheduling-time-span-hours =
    { $amount ->
        [one] { $amount } saat
       *[other] { $amount } saat
    }
scheduling-time-span-days =
    { $amount ->
        [one] { $amount } gün
       *[other] { $amount } gün
    }
scheduling-time-span-months =
    { $amount ->
        [one] { $amount } ay
       *[other] { $amount } ay
    }
scheduling-time-span-years =
    { $amount ->
        [one] { $amount } yıl
       *[other] { $amount } yıl
    }

## Shown in the "Congratulations!" message after study finishes.

scheduling-congratulations-finished = Tebrikler! Bu desteyi şimdilik tamamladınız.
scheduling-today-review-limit-reached =
    Bugünün gözden geçirme sınırına ulaşıldı, ancak hâlâ gözden
    geçirilmeyi bekleyen kartlar var. Optimum hafıza için,
    seçeneklerdeki günlük sınırı arttırmayı düşünün.
scheduling-buried-cards-found = Bir veya daha fazla kart gizlendi, yarın da gösterilecek. Onları hemen görmek istiyorsanız, { $unburyThem }abilirsiniz.
# used in scheduling-buried-cards-found
# "... you can unbury them if you wish to see..."
scheduling-unbury-them = gizlemeyi geri al

## Scheduler upgrade

scheduling-update-done = Planlayıcı başarıyla güncellendi.
scheduling-update-button = Güncelleştir
scheduling-update-later-button = Daha sonra
scheduling-update-more-info-button = Daha Fazla Öğren

## Other scheduling strings

scheduling-at-least-one-step-is-required = En az bir adım gereklidir.
scheduling-automatically-play-audio = Sesi otomatik olarak çal
scheduling-bury-related-new-cards-until-the = Bir sonraki güne kadar ilgili kartları gizle
scheduling-bury-related-reviews-until-the-next = Ertesi güne kadar gizli kartlar gözden geçirilir
scheduling-days = günler
scheduling-description = Açıklama
scheduling-easy-bonus = Kolay ikramiye
scheduling-easy-interval = Kolay süre
scheduling-end = (son)
scheduling-general = Genel
scheduling-graduating-interval = Süreyi bitirme
scheduling-ignore-answer-times-longer-than = Cevap süresinden uzun olanları yok say
scheduling-interval-modifier = Süre ayarlayıcı
scheduling-lapses = Sapmalar
scheduling-learning = Öğrenme
scheduling-leech-action = Sömürü hareketi
scheduling-leech-threshold = Sömürü eşiği
scheduling-maximum-interval = En fazla süre
scheduling-maximum-reviewsday = En fazla gözden geçirme/gün
scheduling-minimum-interval = En düşük süre
scheduling-mix-new-cards-and-reviews = Yeni kartları ve gözden geçirmeleri karıştır
scheduling-new-cards = Yeni Kartlar
scheduling-new-cardsday = Yeni kartlar/gün
scheduling-new-interval = Yeni süre
scheduling-new-options-group-name = Yeni seçenekler grubu adı:
scheduling-options-group = Seçenekler grubu:
scheduling-order = Sıralama
scheduling-parent-limit = (üst sınır: { $val })
scheduling-review = Gözden Geçir
scheduling-reviews = Tekrarlar
scheduling-seconds = saniye
scheduling-set-for-all-subdecks = Tüm alt destler için uygula
scheduling-show-answer-timer = Cevap zamanını göster
scheduling-show-new-cards-after-reviews = Yeni kartları gözden geçirmelerden sonra göster
scheduling-show-new-cards-before-reviews = Yeni kartları gözden geçirmelerden önce göster
scheduling-show-new-cards-in-order-added = Yeni kartları eklendiği sırada göster
scheduling-show-new-cards-in-random-order = Yeni kartları rastgele sırada göster
scheduling-steps-in-minutes = Adımlar (dakikada)
scheduling-steps-must-be-numbers = Adımlar sayı olmalıdır.
scheduling-tag-only = Sadece Etiket
scheduling-the-default-configuration-cant-be-removed = Varsayılan yapılandırma kaldırılamaz.
scheduling-deck-updated =
    { $count ->
        [one] { $count } deste güncellendi.
       *[other] { $count } deste güncellendi.
    }
scheduling-forgot-cards =
    { $cards ->
        [one] { $cards } kart unutuldu.
       *[other] { $cards } kart unutuldu.
    }
