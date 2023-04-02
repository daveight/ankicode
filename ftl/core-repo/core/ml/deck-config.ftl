### Text shown on the "Deck Options" screen


## Top section

# Used in the deck configuration screen to show how many decks are used
# by a particular configuration group, eg "Group1 (used by 3 decks)"
deck-config-used-by-decks =
    ഉപയോഗിച്ചത്{ $decks ->
        [one] { $decks } ഡെക്ക്
       *[other] { $decks } ഡെക്കുകൾ
    }
deck-config-default-name = സ്ഥിരസ്ഥിതി
deck-config-title = ഡെക്ക് ഓപ്ഷനുകൾ

## Daily limits section

deck-config-daily-limits = ദൈനംദിന പരിധികൾ
deck-config-new-limit-tooltip =
    പുതിയ കാർഡുകൾ ലഭ്യമാണെങ്കിൽ, ഒരു ദിവസത്തിൽ അവതരിപ്പിക്കാനുള്ള പരമാവധി എണ്ണം പുതിയ കാർഡുകൾ.
    പുതിയ മെറ്റീരിയൽ നിങ്ങളുടെ ഹ്രസ്വകാല അവലോകന ജോലിഭാരം വർദ്ധിപ്പിക്കുന്നതിനാൽ, ഇത് സാധാരണഗതിയിൽ 
    നിങ്ങളുടെ അവലോകന പരിധിയേക്കാൾ 10 മടങ്ങ് ചെറുതായിരിക്കണം.
deck-config-review-limit-tooltip =
    ഒരു ദിവസത്തിൽ കാണിക്കേണ്ട പരമാവധി അവലോകന കാർഡുകൾ,
    കാർഡുകൾ അവലോകനത്തിന് തയ്യാറാണെങ്കിൽ.
deck-config-limit-deck-v3 =
    സബ്ഡെക്കുകൾ ഉള്ള ഒരു ഡെക്ക്  പഠിക്കുമ്പോൾ, ഓരോന്നിനും പരിധി നിശ്ചയിക്കുന്നു
    നിർദ്ദിഷ്ട ഡെക്കിൽ നിന്ന് വരച്ച കാർഡുകളുടെ പരമാവധി എണ്ണം സബ്ഡെക്ക് നിയന്ത്രിക്കുന്നു.
    തിരഞ്ഞെടുത്ത ഡെക്കിന്റെ പരിധികൾ പ്രദർശിപ്പിക്കപ്പെടുന്ന മൊത്തം കാർഡുകളെ നിയന്ത്രിക്കുന്നു.
deck-config-limit-new-bound-by-reviews = അവലോകന പരിധി പുതിയ പരിധിയെ ബാധിക്കുന്നു. ഉദാഹരണത്തിന്, നിങ്ങളുടെ അവലോകന പരിധി 200 ആയി സജ്ജീകരിച്ച് നിങ്ങൾക്ക് 190 അവലോകനങ്ങൾ കാത്തിരിക്കുകയാണെങ്കിൽ, പരമാവധി 10 പുതിയ കാർഡുകൾ അവതരിപ്പിക്കും. നിങ്ങളുടെ അവലോകനപരിധി എത്തിയിട്ടുണ്ടെങ്കിൽ പുതിയ കാർഡുകളൊന്നും കാണിക്കുന്നതല്ല.

## New Cards section

deck-config-learning-steps = പഠിക്കാനുള്ള ഘട്ടങ്ങൾ
# Please don't translate `1m`, `2d`
-deck-config-delay-hint = കാലതാമസം സാധാരണയായി മിനിറ്റുകൾ (ഉദാ. `1 മി`) അല്ലെങ്കിൽ ദിവസങ്ങൾ (ഉദാ.` 2 ഡി`) ആണ്, എന്നാൽ മണിക്കൂറുകളും (ഉദാ. `1 എച്ച്`) സെക്കൻഡും (ഉദാ.` 30 സെ`) പിന്തുണയ്‌ക്കുന്നു.
deck-config-learning-steps-tooltip = ഒന്നോ അതിലധികമോ കാലതാമസങ്ങൾ, സ്‌പെയ്‌സുകൾ ഉപയോഗിച്ച് വേർതിരിച്ചിരിക്കുന്നു. ഒരു പുതിയ കാർഡിലെ `വീണ്ടും` ബട്ടൺ അമർത്തുമ്പോൾ ആദ്യ കാലതാമസം ഉപയോഗിക്കും, സ്ഥിരസ്ഥിതിയായി ഇത് 1 മിനിറ്റാണ്. `നല്ലത്` ബട്ടൺ അടുത്ത ഘട്ടത്തിലേക്ക് പോകും, ​​ഇത് സ്ഥിരസ്ഥിതിയായി 10 മിനിറ്റ്. എല്ലാ ഘട്ടങ്ങളും കടന്നു കഴിഞ്ഞാൽ, കാർഡ് ഒരു അവലോകന കാർഡായി മാറും, ശേഷം മറ്റൊരു ദിവസം ദൃശ്യമാകും. { -deck-config-delay-hint }
deck-config-graduating-interval-tooltip = അവസാന പഠന ഘട്ടത്തിൽ `നല്ലത്` ബട്ടൺ അമർത്തിയതിനു ശേഷം ഒരു കാർഡ് വീണ്ടും കാണിക്കുന്നതിന് മുമ്പ് കാത്തിരിക്കേണ്ട ദിവസങ്ങളുടെ എണ്ണം
deck-config-easy-interval-tooltip = `എളുപ്പം` ബട്ടൺ അമർത്തി വേഗത്തിൽ നീക്കം ചെയ്ത ഒരു കാർഡ് വീണ്ടും കാണിക്കുന്നതിന് മുമ്പ് കാത്തിരിക്കേണ്ട ദിവസങ്ങളുടെ എണ്ണം
deck-config-new-insertion-order = ഉൾപ്പെടുത്തൽ ക്രമം
deck-config-new-insertion-order-tooltip =
    പുതിയ കാർഡുകൾ ചേർക്കുമ്പോൾ അവയ്ക്കു ലഭിക്കുന്ന സ്ഥാനം (ഡ്യൂ #) നിയന്ത്രിക്കുന്നു.
    ഡ്യൂ നമ്പർ കുറവുള്ള കാർഡുകൾ പഠനസമയത്ത് ആദ്യം കാണിക്കുന്നു. ഈ ഓപ്ഷൻ മാറ്റിക്കഴിഞ്ഞാൽ യാന്ത്രികമായി കാർഡുകളുടെ സ്ഥാനം തിട്ടപ്പെടുത്തും.
deck-config-new-insertion-order-sequential = അനുക്രമം (ആദ്യം പഴയ കാർഡുകൾ)
deck-config-new-insertion-order-random = ക്രമമല്ലാതെ

## Lapses section

deck-config-relearning-steps = വീണ്ടും പഠിക്കാനുള്ള ഘട്ടങ്ങൾ
deck-config-relearning-steps-tooltip = പൂജ്യമോ അതിലധികമോ കാലതാമസം, സ്പേസുകളാൽ ഇടവിട്ടത്. സ്ഥിരസ്ഥിതിയായി, ഒരു അവലോകന കാർഡിലെ `വീണ്ടും` ബട്ടൺ അമർത്തുന്നത് 10 മിനിറ്റിനുശേഷം അത് വീണ്ടും കാണിക്കുന്നതിന് ഇടയാക്കും. കാലതാമസങ്ങളൊന്നും നൽകിയിട്ടില്ലെങ്കിൽ, റീലേർണിംഗിലേക്ക് കടക്കാതെ കാർഡിന്റെ ഇടവേള മാറ്റപ്പെടും. { -deck-config-delay-hint }
deck-config-leech-threshold-tooltip = ഒരു അവലോകന കാർഡ് അട്ടയായി അടയാളപ്പെടുത്താൻ `വീണ്ടും` എത്ര തവണ അമർത്തണം. നിങ്ങളുടെ സമയം ഒരുപാട് വലിച്ചെടുക്കുന്ന കാർഡുകൾ അട്ടകളാണ്. അവയെ മാറ്റി എഴുതുന്നതും, ഒഴിവാക്കുന്നതും, അവയെ ആലോചിച്ചെടുക്കാൻ ഒരു മെമോണിക് തയ്യാറാക്കുന്നതും നല്ല ആശയങ്ങളാണ്.
# See actions-suspend-card and scheduling-tag-only for the wording
deck-config-leech-action-tooltip =
    ടാഗ് മാത്രം: "അട്ട" ടാഗ് കുറിപ്പിലേക്ക് ചേർത്ത്, ഒരു പോപ്പ്-അപ്പ് പ്രദർശിപ്പിക്കുക.¶
    ¶
    `സസ്‌പെൻഡ് കാർഡ്`: ഒരു കുറിപ്പ് ടാഗ് ചെയ്യുന്നതിലുപരി, അതിനെ കരകൃതമായി അൺസസ്‌പെൻഡ് ചെയുന്നതു വരെ അദൃശ്യമാക്കാൻ സാധിക്കും.

## Burying section

deck-config-bury-title = കുഴിച്ചിടുന്നു
deck-config-bury-new-siblings = പുതിയ സഹോദരങ്ങളെ അടുത്ത ദിവസം വരെ കുഴിച്ചിടുക
deck-config-bury-review-siblings = അവലോകന സഹോദരങ്ങളെ അടുത്ത ദിവസം വരെ കുഴിച്ചിടുക
deck-config-bury-tooltip = സമാന കുറിപ്പിന്റെ മറ്റ് കാർഡുകൾ (ഉദാ: റിവേഴ്സ് കാർഡുകളിൽ, അടുത്തുള്ള ക്ലോസ് ഇല്ലാതാക്കലുകൾ) അടുത്ത ദിവസം വരെ വൈകും.

## Ordering section

deck-config-ordering-title = പ്രദർശന ക്രമം
deck-config-new-gather-priority = പുതിയ കാർഡ് മുൻ‌ഗണന ശേഖരിക്കുന്നു
deck-config-new-gather-priority-tooltip = `ഡെക്ക്`: ഓരോ സബ്ഡെക്കിൽ നിന്നും ക്രമത്തിൽ കാർഡുകൾ ശേഖരിക്കുകയും തിരഞ്ഞെടുത്ത ഡെക്കിന്റെ പരിധി കവിഞ്ഞാൽ നിർത്തുകയും ചെയ്യുന്നു. ഇത് വേഗതയേറിയതാണ്, ഒപ്പം മുകളിലേക്ക് അടുത്തുള്ള സബ്ഡെക്കുകൾക്ക് മുൻ‌ഗണന നൽകാൻ നിങ്ങളെ അനുവദിക്കുന്നു. `സ്ഥാനം`: അടുക്കുന്നതിന് മുമ്പ് എല്ലാ ഡെക്കുകളിൽ നിന്നും കാർഡുകൾ ശേഖരിക്കുന്നു. എല്ലാ ഡെക്കുകളിൽ നിന്നും കാർഡുകൾ കാണുന്നതിന് പാരന്റ് പരിധി ഉയർന്നതല്ലെങ്കിലും, ഏറ്റവും പഴയ കാർഡുകൾ ആദ്യം കാണിക്കുമെന്ന് ഇത് ഉറപ്പാക്കുന്നു.
deck-config-new-gather-priority-deck = ഡെക്ക്
deck-config-new-gather-priority-position-lowest-first = സ്ഥാനം (ആദ്യത്തേത് ഏറ്റവും താഴ്ന്നത്)
deck-config-new-gather-priority-position-highest-first = സ്ഥാനം (ഏറ്റവും ഉയർന്നത് ആദ്യം)
deck-config-new-card-sort-order = പുതിയ കാർഡ് തരം ക്രമം
deck-config-new-card-sort-order-tooltip = എങ്ങനെയാണ് കാർഡുകൾ ശേഖരിച്ചതിനു ശേഷം തിട്ടപ്പെടുത്തുന്നത്? സ്ഥിരസ്ഥിതിയിൽ, Anki കാർഡ് ടെംപ്ലേറ്റുകളുടെ സഹായത്താൽ ആദ്യം കാർഡുകളെ തിട്ടപ്പെടുത്തുന്നു. ഇത് ഒരേ കുറിപ്പുള്ള ഒന്നിലധികം  കാർഡുകൾ ഒന്നിന് പിറകെ ഒന്നായി കാണിക്കാതിരിക്കാൻ സഹായിക്കുന്നു.
deck-config-sort-order-card-template-then-lowest-position = കാർഡ് ടെംപ്ലേറ്റ്, തുടർന്ന് ഏറ്റവും താഴ്ന്ന സ്ഥാനം
deck-config-sort-order-card-template-then-highest-position = കാർഡ് ടെംപ്ലേറ്റ്, തുടർന്ന് ഏറ്റവും ഉയർന്ന സ്ഥാനം
deck-config-sort-order-card-template-then-random = കാർഡ് ടെംപ്ലേറ്റ്, തുടർന്ന് ക്രമരഹിതം
deck-config-sort-order-lowest-position = ഏറ്റവും താഴ്ന്ന സ്ഥാനം
deck-config-sort-order-highest-position = ഏറ്റവും ഉയർന്ന സ്ഥാനം
deck-config-sort-order-random = ക്രമരഹിതം
deck-config-new-review-priority = പുതിയ / അവലോകന മുൻ‌ഗണന
deck-config-new-review-priority-tooltip = അവലോകന കാർഡുകളുമായി ബന്ധപ്പെട്ട് പുതിയ കാർഡുകൾ എപ്പോൾ കാണിക്കണം.
deck-config-interday-step-priority = ഇന്റർഡേ ലേണിംഗ് / അവലോകന മുൻ‌ഗണന
deck-config-interday-step-priority-tooltip = ഒരു ദിവസത്തെ അതിർത്തി കടക്കുന്ന (വീണ്ടും) പഠന കാർഡുകൾ എപ്പോൾ കാണിക്കണം.
deck-config-review-mix-mix-with-reviews = അവലോകനങ്ങളുമായി മിക്സ് ചെയ്യുക
deck-config-review-mix-show-after-reviews = അവലോകനങ്ങൾക്ക് ശേഷം കാണിക്കുക
deck-config-review-mix-show-before-reviews = അവലോകനങ്ങൾക്ക് മുമ്പ് കാണിക്കുക
deck-config-review-sort-order = അടുക്കൽ ക്രമം അവലോകനം ചെയ്യുക
deck-config-review-sort-order-tooltip = സ്ഥിരസ്ഥിതിയിലുള്ള ക്രമം മുൻ‌തൂക്കം നൽകുന്നത് പട്ടികയിൽ ഏറ്റുവും കൂടുതൽ സമയം കാത്തിരുന്ന കാർഡുകൾക്കാണ്. അതിനാൽ അവലോകനത്തിൽ ബാക്ക്ലോഗ് ഉണ്ടെങ്കിൽ ഏറ്റവും കൂടുതൽ സമയം കാത്തു നിന്ന കാർഡുകൾ ആദ്യം പ്രത്യക്ഷപ്പെടും. വലിയ ബാക്ക്ലോഗ് മായ്ക്കുവാൻ കുറച്ചു ദിവസങ്ങൾക്കപ്പുറം എടുത്തേക്കാവുന്ന സാഹചര്യമാണെങ്കിലോ അല്ലെങ്കിൽ കാർഡുകൾ ഉപഡെക്ക് ക്രമത്തിൽ വീക്ഷിക്കണമെങ്കിലോ മറ്റു ക്രമങ്ങൾ ഉപയോഗിക്കുന്നത് ഉത്തമമായിരിക്കും.
deck-config-sort-order-due-date-then-random = അവസാന തീയതി, തുടർന്ന് ക്രമരഹിതം
deck-config-sort-order-due-date-then-deck = അവസാന തീയതി, തുടർന്ന് ഡെക്ക്
deck-config-sort-order-deck-then-due-date = ഡെക്ക്, തുടർന്ന് നിശ്ചിത തീയതി
deck-config-sort-order-ascending-intervals = ആരോഹണ ഇടവേളകൾ
deck-config-sort-order-descending-intervals = അവരോഹണ ഇടവേളകൾ

## Timer section

deck-config-timer-title = ടൈമർ
deck-config-maximum-answer-secs = പരമാവധി ഉത്തര സെക്കൻഡ്
deck-config-maximum-answer-secs-tooltip = ഒരൊറ്റ അവലോകനം റെക്കോഡ് ചെയ്യാൻ ഉപയോഗിച്ച ഏറ്റവും കൂടുതൽ സമയം (സെക്കന്റുകളിൽ). ഇപ്പോൾ ഒരുത്തരത്തിനു സമയം അതിക്രമിച്ചാൽ (ഉദാഹരണത്തിന് നിങ്ങൾ സ്‌ക്രീനിൽ നിന്നും കുറച്ചു നേരത്തേക്ക് അകലേക്ക്‌ പോയാൽ), നിങ്ങൾ തീരുമാനിച്ച സമയമായിരിക്കും റെക്കോർഡ് ചെയ്യപ്പെടുന്നത്.
deck-config-show-answer-timer-tooltip = അവലോകന സ്‌ക്രീനിൽ, ഓരോ കാർഡും അവലോകനം ചെയ്യാൻ നിങ്ങൾ എടുക്കുന്ന സെക്കൻഡുകളുടെ എണ്ണം കണക്കാക്കുന്ന ഒരു ടൈമർ കാണിക്കുക.

## Audio section

deck-config-audio-title = ഓഡിയോ
deck-config-disable-autoplay = ഓഡിയോ യാന്ത്രികമായി പ്ലേ ചെയ്യരുത്
deck-config-always-include-question-audio-tooltip = ഒരു കാർഡിന്റെ ഉത്തര വശത്ത് നോക്കികൊണ്ട് റീപ്ലേ പ്രവർത്തനം ഉപയോഗിക്കുമ്പോൾ ചോദ്യ ഓഡിയോ ഉൾപ്പെടുത്തണമോ എന്ന്.

## Advanced section

deck-config-advanced-title = നൂതനമായത്
deck-config-maximum-interval-tooltip = ഒരു അവലോകന കാർഡ് കാത്തു നിൽക്കുന്ന ഏറ്റവും കൂടുതൽ ദിവസങ്ങൾ. ¶അവലോകനങ്ങൾ അവയുടെ പരിധിയിലെത്തിയാൽ, `കഠിനം`, `നല്ലത്`, `എളുപ്പം` തുടങ്ങിയവയ്‌ക്കെല്ലാം ഒരേ കാലതാമസം ലഭിക്കും. ¶ഇത് എത്രത്തോളം കുറച്ചു സജ്ജീകരിക്കുന്നുവോ, അത്രത്തോളം കൂടുതലായിരിക്കും നിങ്ങളുടെ പഠനഭാരം.
deck-config-starting-ease-tooltip = പുതിയ കാർഡുകൾ തുടങ്ങുമ്പോൾ ഉപയോഗിക്കുന്ന എളുപ്പ ഗുണിതം. സ്ഥിരസ്ഥിതിയിൽ, `നല്ലത്` ബട്ടൺ ഉപയോഗിച്ചാൽ പുതുതായി പഠിച്ച കാർഡിന്റെ കാലതാമസം മുൻപത്തെ കാലതാമസത്തിന്റെ 2.5x കൂടുതലാണ്.
deck-config-easy-bonus-tooltip = ഒരു അവലോകന കാർഡ് `എളുപ്പം` എന്ന് നിർണയിക്കുമ്പോൾ അതിന്റെ ഇടവേളയിൽ ഗുണനം ചെയ്യപ്പെടുന്ന അധിക സംഖ്യ.
deck-config-interval-modifier-tooltip = ഈ ഗുണിതം എല്ലാ അവലോകങ്ങൾക്കും ബാധകമാണ്; ഇതിന്റെ നേരിയ വ്യതിയാനങ്ങൾ ഉപയോഗിച്ച് Anki-യെ കൂടുതൽ യാഥാസ്ഥിതികമോ അല്ലെങ്കിൽ ആക്രമണാത്മകമോ ആക്കി ഷെഡ്യൂൾ ചെയ്യാൻ സാധിക്കും. ഈ ഓപ്ഷൻ മാറ്റുന്നതിന് മുൻപ് മാന്വൽ സന്ദർശിക്കുക.
deck-config-hard-interval-tooltip = `കഠിനം` എന്ന് ഉത്തരം നൽകുമ്പോൾ അവലോകന ഇടവേളയിൽ പ്രയോഗിച്ച ഗുണിതം.
deck-config-new-interval-tooltip = `വീണ്ടും` എന്ന് ഉത്തരം നൽകുമ്പോൾ അവലോകന ഇടവേളയിൽ പ്രയോഗിച്ച ഗുണിതം.
deck-config-minimum-interval-tooltip = `വീണ്ടും` എന്ന് മറുപടി നൽകിയതിന് ശേഷം അവലോകന കാർഡിന് നൽകുന്ന ഏറ്റവും കുറഞ്ഞ ഇടവേള.
deck-config-custom-scheduling = ഇഷ്‌ടാനുസൃത ഷെഡ്യൂളിംഗ്
deck-config-custom-scheduling-tooltip = മുഴുവൻ ശേഖരത്തെയും ബാധിക്കുന്നു. നിങ്ങളുടെ സ്വന്തം ഉത്തരവാദിത്വത്തിൽ ഉപയോഗിക്കുക!

## Adding/renaming

deck-config-add-group = പ്രീസെറ്റ് ചേർക്കുക
deck-config-name-prompt = നാ‍മം
deck-config-rename-group = പ്രീസെറ്റിന്റെ പേരുമാറ്റുക
deck-config-clone-group = ക്ലോസ് പ്രീസെറ്റ്

## Removing

deck-config-remove-group = പ്രീസെറ്റ് നീക്കംചെയ്യുക
deck-config-confirm-normal = { $name } നീക്കം ചെയ്യണോ?
deck-config-will-require-full-sync = അഭ്യർത്ഥിച്ച മാറ്റത്തിന് വൺ-വേ സമന്വയം ആവശ്യമാണ്. നിങ്ങൾ മറ്റൊരു ഉപകരണത്തിൽ മാറ്റങ്ങൾ വരുത്തുകയും അവ ഇതുവരെ ഈ ഉപകരണത്തിലേക്ക് സമന്വയിപ്പിക്കുകയും ചെയ്തിട്ടില്ലെങ്കിൽ, തുടരുന്നതിന് മുമ്പ് ദയവായി അങ്ങനെ ചെയ്യുക.
deck-config-confirm-remove-name = { $name } നീക്കം ചെയ്യണോ?

## Other Buttons

deck-config-save-button = സംരക്ഷിക്കുക
deck-config-save-to-all-subdecks = എല്ലാ ഉപഡെക്കുകളിലും സംരക്ഷിക്കുക
deck-config-revert-button-tooltip = ഈ ക്രമീകരണം അതിന്റെ സ്ഥിര മൂല്യത്തിലേക്ക് പുനഃസ്ഥാപിക്കുക.

## These strings are shown via the Description button at the bottom of the
## overview screen.

deck-config-description-markdown = മാർക്ക്ഡൗൺ + ക്ലീൻ HTML പ്രവർത്തനക്ഷമമാക്കുക
deck-config-description-markdown-hint = Anki 2.1.40 ലും അതിനു താഴെയുള്ളതിലും വാചകമായി ദൃശ്യമാകും.

## Warnings shown to the user

deck-config-daily-limit-will-be-capped =
    Zero or more delays, separated by spaces. By default, pressing the `Again` button on a review card will show it again 10 minutes later. If no delays are provided, the card will have its interval changed, without entering relearning.
    
    ഒരു പാരന്റ് ഡെക്കിനുള്ള പരിധി{ $cards ->
        [one] { $cards } കാർഡ്
       *[other] { $cards } കാർഡുകൾ
    }, അത് പരിധിയെ ഓവർറൈഡ് ചെയ്യും
deck-config-reviews-too-low =
    ഇപ്പോൾ ചേർക്കുന്നത് ഇപ്രകാരമാണെങ്കിൽ:{ $cards ->
        [one] ഒരു ദിവസം { $cards } പുതിയ കാർഡ്
       *[other] ഒരു ദിവസം { $cards } പുതിയ കാർഡുകൾ
    } നിങ്ങളുടെ അവലോകന പരിധി കുറഞ്ഞത് { $expected } ആയിരിക്കണം.
deck-config-learning-step-above-graduating-interval = ബിരുദ ഇടവേള നിങ്ങളുടെ അവസാന പഠന ഘട്ടത്തിന്റെയത്ര നീണ്ടിരിക്കണം.
deck-config-good-above-easy = എളുപ്പമുള്ള ഇടവേള കുറഞ്ഞത് ബിരുദ ഇടവേളയുടെയത്രയും നീണ്ടതായിരിക്കണം.
deck-config-relearning-steps-above-minimum-interval = ഏറ്റവും കുറഞ്ഞ വീഴ്ച്ചാ ഇടവേള  നിങ്ങളുടെ അവസാന റീലേർണിംഗ് ഘട്ടത്തിന്റെ അത്രയെങ്കിലും നീളമുള്ളതാകണം.

## Selecting a deck

deck-config-which-deck = ഏത് ഡെക്ക് ആണ് നിങ്ങൾ ആഗ്രഹിക്കുന്നത്?
