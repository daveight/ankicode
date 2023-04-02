### These messages are shown on the review screen, preview screen, and
### card template screen when the user has made a mistake in their card
### template, or the front of the card is empty.

# Label of link users can click on
card-template-rendering-more-info = Детальніше
card-template-rendering-front-side-problem = На шаблоні передньої сторони є проблема:
card-template-rendering-back-side-problem = На шаблоні задньої сторони є проблема:
# when the user forgot to close a field reference,
# eg, Missing '}}' in '{{Field'
card-template-rendering-no-closing-brackets = Відсутнє «{ $missing }» в «{ $tag }»
# when the user opened a conditional, but forgot to close it
# eg, Missing '{{/Conditional}}'
card-template-rendering-conditional-not-closed = Відсутнє «{ $missing }»
# when the user closed the wrong conditional
# eg, Found '{{/Something}}', but expected '{{/SomethingElse}}'
card-template-rendering-wrong-conditional-closed = Знайдено «{ $found }», але очікувано «{ $expected }»
# when the user closed a conditional that wasn't open
# eg, Found '{{/Something}}', but missing '{{#Something}}' or '{{^Something}}'
card-template-rendering-conditional-not-open = Знайдено «{ $found }», але відсутні «{ $missing1 }» чи «{ $missing2 }»
# when the user referenced a field that doesn't exist
# eg, Found '{{Field}}', but there is not field called 'Field'
card-template-rendering-no-such-field = Знайдено «{ $found }», але ці поля не називаються «{ $field }»
# This message is shown when the front side of the card is blank,
# either due to a badly-designed template, or because required fields
# are missing.
card-template-rendering-empty-front = Лицева сторона картки пуста.
card-template-rendering-missing-cloze =
    Не знайдено завдання з пропусками { $number } на картці
    Будь ласка, або додайте завдання з пропусками, або скористайтеся інструментом «Порожні картки».
