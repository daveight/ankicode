### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    استفاده شده توسط{ $decks ->
       *[other] { $decks } عدد دسته
    }
deck-config-default-name = پیش‌فرض
deck-config-title = تنظیمات دسته

## Daily limits section

deck-config-daily-limits = حد روزانه
deck-config-new-limit-tooltip =
    حداکثر تعداد کارت‌های جدید روزانه، در صورتی که کارت جدید وجود داشته باشد.
    به دلیل اینکه اطلاعات جدید بار حافظه کوتاه‌مدت شما را زیاد می‌کند، تعداد این
    باید حداقل 10 برابر از حد مرور شما کمتر باشد.
deck-config-review-limit-tooltip =
    حداکثر کارت‌ها برای مرور در یک روز،
    در صورتی که کارتی برای مرور وجود داشته باشد.
deck-config-limit-deck-v3 =
    هنگامی که کارت‌ها از دسته‌ای که دارای زیردسته است انتخاب می‌شوند، حد هر زیردسته
    حداکثر تعداد کارت‌های انتخابی از آن دسته را تعیین می‌کند. حد دسته والد، حداکثر کلی
    تعداد کارت‌های نمایش داده شده را تعیین می‌کند.
deck-config-limit-new-bound-by-reviews =
    حد مرور بر حد کارت‌های جدید نیز تأثیر می‌گذارد. برای مثال، اگر حد مرور
    روی 200 تنظیم شده باشد و شما 190 کارت مرور داشته باشید، حداقل
    10 کارت جدید برای شما نمایش داده خواهد شد. اگر تعداد کارت‌های مرور شما
    به حد مرور شما برسند، هیچ کارت جدیدی به جای کارت مرور برای شما نمایش داده نخواهد شد.
deck-config-limit-interday-bound-by-reviews =
    حد مرور بر کارت‌هایی که در مرحله یادگیری قرار دارند نیز تأثیر می‌گذارد.
    هنگام اعمال کردن حد مرور، ابتدا کارت‌هایی که در مرحله یادگیری قرار دارند
    نمایش داده خواهند شد، سپس کارت‌های مرور و در نهایت کارت‌های نمایش داده خواهند شد.

## New Cards section

deck-config-learning-steps = مراحل یادگیری
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = مراحل معمولاً دقیقه (مثلاً`1m`) یا روز (مثلاً `2d`) هستند ولی ساعت (مثلاً `1h`) و ثانیه (مثلاً `30s`) نیز پشتیبانی می‌شوند.
deck-config-learning-steps-tooltip =
    مراحل با فاصله (Space) جدا می‌شوند. هنگام فشار دادن `دوباره` روی یک کارت جدید
    نخستین مرحله استفاده می‌شود. این مقدار به صورت پیش‌فرض 1 دقیقه است.
    دکمه `خوب` باعث می‌شود کارت به مرحله بعدی برود، این مقدار به صورت پیش‌فرض
    10 دقیقه است. هنگامی که همه مراحل یادگیری گذرانده شد، کارت به کارت مرور تبدیل
    خواهد شد و یک روز دیگر نمایش داده خواهد شد. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip =
    تعداد روزهایی که قبل از نمایش مجدد کارت بعد از فشار دادن دکمه `خوب` در
    آخرین مرحله یادگیری یک کارت، باید سپری شوند.
deck-config-easy-interval-tooltip =
    تعداد روزهایی که برای نمایش مجدد یک کارت پس از فشار دادن دکمه 'آسان'
    برای خروج بلافاصله یک کارت از مرحله یادگیری باید سپری شوند.
deck-config-new-insertion-order = ترتیب ورود
deck-config-new-insertion-order-tooltip =
    موقعیت کارت‌ها (due #) در هنگام افزودن کارت‌های جدید را تعیین می‌کند.
    کارت‌هایی که موقعیت پایین‌تری دارند در هنگام مطالعه کارت‌ها، زودتر نمایش
    داده خواهند شد. تغییر این گزینه، به صورت خودکار موقعیت کارت‌های جدید
    دیگر را نیز تغییر خواهد داد.
deck-config-new-insertion-order-sequential = به ترتیب (قدیمی‌ترین کارت در ابتدا)
deck-config-new-insertion-order-random = تصادفی

## Lapses section

deck-config-relearning-steps = قدم‌های یادگیری مجدد
deck-config-relearning-steps-tooltip =
    هیچ یا چند قدم یادگیری که با فاصله (Space) جدا شده‌اند. فشار دادن
    دکمه `دوباره` روی یک کارت در مرحله مرور، باعث نمایش دوباره
    آن کارت 10 دقیقه بعد خواهد شد. اگر هیچ قدمی وارد نشود، بازه
    مرور کارت بدون وارد شدن به مرحله یادگیری مجدد تغییر خواهد کرد. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip =
    تعداد دفعاتی که باید دکمه `دوباره` روی یک کارت فشار داده شود
    تا یک کارت به عنوان کارت سخت علامت زده شود. کارت‌های سخت
    کارت‌هایی هستند که مقدار زیادی از زمان شما را به خود اختصاص می‌دهند.
    هنگامی که یک کارت به عنوان کارت سخت علامت زده می‌شود، بهتر است این
    کارت را دوباره بنویسید، حذف کنید یا راهی برای به خاطر سپردن آن کارت 
    پیدا کنید.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    `فقط علامت زده شود`: یک برچسب `leech` به کارت اضافه کرده و یک
    پیام برای شما نمایش می‌دهد
    
    `تعلیق کارت`: علاوه بر علامت‌گذاری کارت، باعث تعلیق کارت می‌شود.
    این کارت تا زمانی که به صورت دستی لغو تعلیق شود، نمایش داده نخواهد شد.

## Burying section

deck-config-bury-title = دفن کردن
deck-config-bury-new-siblings = کارت‌های جدید مرتبط تا روز بعد دفن شوند
deck-config-bury-review-siblings = کارت‌های مرور مرتبط تا روز بعد دفن شوند
deck-config-bury-tooltip =
    کارت‌هایی که از یک نوع هستند (مثلاً کارت‌های جاخالی که از یک
    یادداشت ساخته می‌شوند) با تأخیر نمایش داده شوند یا خیر.

## Ordering section

deck-config-ordering-title = ترتیب نمایش
deck-config-new-gather-priority = ترتیب جمع‌آوری کارت‌های جدید
deck-config-new-gather-priority-tooltip =
    `دسته`: کارت‌ها را به ترتیب از هر زیردسته جمع‌آوری می‌کند و زمانی که
    به حد دسته رسید، متوقف می‌شود. این کار سریع‌تر است و به شما کمک می‌کند
    که دسته‌ها را به ترتیب نزدیکی به بالا اولویت‌بندی کنید.
    
    `موقعیت`: کارت‌ها را از همه دسته‌ها قبل از مرتب‌سازی جمع‌آوری می‌کند. این کار
    باعث نمایش کارت‌ها به ترتیب موقعیت (due #) می‌شود حتی اگر کارت در دسته‌ای
    قرار دارد که به بالا نزدیک‌تر نیست.
deck-config-new-gather-priority-deck = دسته
deck-config-new-gather-priority-position-lowest-first = ترتیب صعودی
deck-config-new-gather-priority-position-highest-first = ترتیب نزولی
deck-config-new-card-sort-order = ترتیب نمایش کارت‌های جدید
deck-config-new-card-sort-order-tooltip =
    ترتیب نمایش کارت‌ها بعد از جمع‌آوری. آنکی به صورت پیش‌فرض
    و جهت جلوگیری از نمایش چندین کارت از یک یادداشت به صورت متوالی
    کارت‌ها را ابتدا به ترتیب قالب کارت مرتب می‌کند.
deck-config-sort-order-card-template-then-lowest-position = قالب کارت، سپس ترتیب صعودی
deck-config-sort-order-card-template-then-highest-position = قالب کارت، سپس ترتیب نزولی
deck-config-sort-order-card-template-then-random = قالب کارت، سپس به صورت تصادفی
deck-config-sort-order-lowest-position = ترتیب صعودی
deck-config-sort-order-highest-position = ترتیب نزولی
deck-config-sort-order-random = تصادفی
deck-config-sort-order-template-then-gather = قالب کارت، سپس به ترتیب جمع‌آوری
deck-config-sort-order-gather = به ترتیب جمع‌آوری
deck-config-new-review-priority = ترتیب کارت جدید/مرور
deck-config-new-review-priority-tooltip = زمان نمایش کارت‌های جدید در ارتباط با کارت‌های مرور.
deck-config-interday-step-priority = ترتیب نمایش کارت‌های یادگیری/مرور روزانه
deck-config-interday-step-priority-tooltip =
    زمان نمایش کارت‌های یادگیری (مجدد) هنگامی که
    زمان مرور از حد یک روز بیشتر شود.
    
    حد مرور همیشه ابتدا به کارت‌های یادگیری با زمان مرور
    کمتر از یک روز و سپس به کارت‌های مرور اعمال می‌شود.
    این گزینه ترتیب نمایش کارت‌های جمع‌آوری شده را تعیین می‌کند،
    ولی کارت‌هایی که در مرحله یادگیری دارند و زمان مرورشان کمتر از
    یک روز است همواره ابتدا نمایش داده خواهند شد.
deck-config-review-mix-mix-with-reviews = ترکیب با کارت‌های مرور
deck-config-review-mix-show-after-reviews = نمایش بعد از کارت‌های مرور
deck-config-review-mix-show-before-reviews = نمایش قبل از کارت‌های مرور
deck-config-review-sort-order = ترتیب مرور
deck-config-review-sort-order-tooltip =
    ترتیب نمایش پیش‌فرض کارت‌هایی را ابتدا نمایش می‌دهد که مدت زمان
    بیشتری نمایش داده نشده‌اند، تا اگر کارت‌های عقب افتاده دارید، کارت‌هایی
    که زمان بیشتری منتظر بوده‌اند ابتدا نمایش داده شوند. اگر تعداد کارت‌های
    عقب افتاده شما بیش از اندازه زیاد است و مرور کامل آنها بیشتر از چند روز
    طول می‌کشد، یا اگر می‌خواهید کارت‌ها به ترتیب زیردسته‌ها نمایش داده شوند
    ممکن است از ترتیب‌های نمیش دیگر بیشتر خوشتان بیاید.
deck-config-sort-order-due-date-then-random = زمان مرور، سپس تصادفی
deck-config-sort-order-due-date-then-deck = زمان مرور، سپس به ترتیب دسته
deck-config-sort-order-deck-then-due-date = دسته، سپس به ترتیب تاریخ مرور
deck-config-sort-order-ascending-intervals = افزایش بازه زمانی
deck-config-sort-order-descending-intervals = کاهش بازه زمانی
deck-config-sort-order-ascending-ease = افزایش سختی
deck-config-sort-order-descending-ease = کاهش سختی
deck-config-display-order-will-use-current-deck =
    آنکی از ترتیب نمایش کارت‌ها در دسته انتخاب شده
    استفاده خواهد کرد و از ترتیب نمایش کارت‌ها در 
    زیر دسته‌ها استفاده نخواهد کرد.

## Timer section

deck-config-timer-title = زمان سنج
deck-config-maximum-answer-secs = حداکثر زمان پاسخ (ثانیه)
deck-config-maximum-answer-secs-tooltip =
    حداکثر زمان به ثانیه که برای مرور یک کارت ثبت خواهد شد. اگر
    زمان بیشتری برای مرور یک کارت ثبت شود (برای مثال به دلیل اینکه
    شما پشت سیستم نبودید) این زمان حداکثر به عنوان زمان مرور کارت
    ثبت خواهد شد.
deck-config-show-answer-timer-tooltip =
    در صفحه مرور کارت‌ها، یک زمان سنج نشان می‌دهد که زمانی که
    صرف مرور یک کارت می‌شود (به ثانیه) را نشان می‌دهد.

## Audio section

deck-config-audio-title = صدا
deck-config-disable-autoplay = صدا به صورت خودکار پخش نشود
deck-config-skip-question-when-replaying = هنگام پخش پاسخ، سوال رد شود
deck-config-always-include-question-audio-tooltip =
    اینکه هنگام استفاده از پخش صدا در هنگام نمایش پاسخ
    صدای موجود در طرف سوال نیز پخش شود یا نه.

## Advanced section

deck-config-advanced-title = پیشرفته
deck-config-maximum-interval-tooltip =
    حداکثر تعداد روزهایی که برای نمایش مجدد کارت طول خواهد کشید.
    هنگامی که یک کارت به حداکثر میزان زمان مرور مجدد رسید، هر چهار دکمه
    `سخت`، `خوب`و `دوباره` زمان مرور مشابهی را به کارت خواهند داد.
    هرچه این مقدار کمتر باشد، میزان کارت‌های مروری شما در آینده بیشتر خواهند شد.
deck-config-starting-ease-tooltip =
    میزان آسانی که کارت‌ها بلافاصله بعد از خارج شدن از مرحله یادگیری خواهند داشت.
    به صورت پیش‌فرض، فشار دادن دکمه `خوب` روی کارتی که تازه از مرحله یادگیری
    خارج شده است، زمان مرور بعدی را 2.5 برابر مرور قبلی خواهد کرد.
deck-config-easy-bonus-tooltip =
    یک عامل تغییردهنده زمان مرور دیگر که هنگام انتخاب
    دکمه `آسان` زمان مرور بعدی را بیشتر خواهد کرد.
deck-config-interval-modifier-tooltip =
    این عامل روی همه مرورها اعمال می‌شود. می‌توانید از تغییرات
    جزئی جهت افزایش یا کاهش میزان زمان کلی مرورها استفاده کنید.
    لطفاً قبل از تغییر این گزینه، راهنمای آنکی را مطالعه کنید.
deck-config-hard-interval-tooltip =
    عامل تغییردهنده زمان مرور که در هنگام فشار دادن دکمه `سخت`
    روی یک کارت اعمال می‌شود.
deck-config-new-interval-tooltip =
    عامل تغییردهنده زمان مرور که در هنگام فشار دادن دکمه `دوباره`
    روی یک کارت اعمال می‌شود.
deck-config-minimum-interval-tooltip =
    حداقل زمان مرور دوباره که پس از استفاده از دکمه `دوباره`
    روی یک کارت، به آن کارت داده می‌شود.
deck-config-custom-scheduling = زمانبندی سفارشی
deck-config-custom-scheduling-tooltip = همه مجموعه را تحت تأثیر قرار خواهد داد. با مسئولیت خود از این گزینه استفاده کنید!

## Adding/renaming

deck-config-add-group = افزودن پیش‌تنظیم
deck-config-name-prompt = نام
deck-config-rename-group = نامگذاری مجدد پیش‌تنظیم
deck-config-clone-group = تکثیر پیش‌تنظیم

## Removing

deck-config-remove-group = حذف پیش‌تنظیم
deck-config-confirm-normal = حذف { $name }؟
deck-config-will-require-full-sync =
    تغییرات موردنظر شما نیاز به همگام‌سازی یک طرفه خواهند داشت. اگر
    تغییراتی روی دستگاه‌های دیگر دارید که هنوز با این دستگاه همگام‌سازی
    نشده‌اند، لطفاً قبل از ادامه این عمل، این تغییرات را با این دستگاه همگام‌سازی کنید.
deck-config-confirm-remove-name = حذف { $name }؟

## Other Buttons

deck-config-save-button = ذخیره
deck-config-save-to-all-subdecks = ذخیره در همه زیردسته‌ها
deck-config-revert-button-tooltip = بازنشانی این گزینه به مقدار پیش‌فرض.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-new-handling = رسیدگی آنکی 2.1.41+
deck-config-description-new-handling-hint =
    با ورودی همانند markdown رفتار خواهد کرد و HTML را مرتب
    خواهد کرد. هنگامی که این گزینه فعال شود، توضیحات در صفحه‌ها
    تبریک نیز نمایش داده خواهند شد. در نسخه‌های آنکی قدیمی‌تر از 2.1.40
    markdown به صورت متن خام نمایش داده خواهد شد.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    محدودیت دسته والد{ $cards ->
       *[other] { $cards } کارت است
    }، که این مقدار را لغو خواهد کرد.
deck-config-reviews-too-low =
    در صورتی که روزانه { $cards ->
       *[other] { $cards } کارت اضافه می‌کنید
    }، حد مرور شما باید حداقل { $expected } باشد.
deck-config-learning-step-above-graduating-interval = بازه زمانی فارغ شدن کارت باید حداقل هم‌اندازه با آخرین قدم یادگیری شما باشد.
deck-config-good-above-easy = بازه زمانی آسان باید حداقل هم‌اندازه با بازه زمانی فارغ شدن کارت باشد.
deck-config-relearning-steps-above-minimum-interval = بازه زمانی فراموشی کارت باید حداقل هم‌اندازه با آخرین قدم یادگیری مجدد شما باشد.

## Selecting a deck

deck-config-which-deck = کدام دسته را انتخاب می‌کنید؟
