### These messages are shown on the review screen, preview screen, and
### card template screen when the user has made a mistake in their card
### template, or the front of the card is empty.

# Label of link users can click on
card-template-rendering-more-info = Daha fazla bilgi
card-template-rendering-front-side-problem = Ön şablonda bir hata var:
card-template-rendering-back-side-problem = Arka şablonda bir hata var:
card-template-rendering-browser-front-side-problem = Tarayıcıya özgü ön şablonda bir hata var:
card-template-rendering-browser-back-side-problem = Tarayıcıya özgü arka şablonda bir hata var:
# when the user forgot to close a field reference,
# eg, Missing '}}' in '{{Field'
card-template-rendering-no-closing-brackets = '{ $tag }' içinde '{ $missing }' eksik
# when the user opened a conditional, but forgot to close it
# eg, Missing '{{/Conditional}}'
card-template-rendering-conditional-not-closed = '{ $missing }' eksik
# when the user closed the wrong conditional
# eg, Found '{{/Something}}', but expected '{{/SomethingElse}}'
card-template-rendering-wrong-conditional-closed = '{ $found }' bulundu, ama '{ $expected }' beklendi
# when the user closed a conditional that wasn't open
# eg, Found '{{/Something}}', but missing '{{#Something}}' or '{{^Something}}'
card-template-rendering-conditional-not-open = '{ $found }' bulundu, ama '{ $missing1 }' ya da '{ $missing2 }' eksik
# This message is shown when the front side of the card is blank,
# either due to a badly-designed template, or because required fields
# are missing.
card-template-rendering-empty-front = Bu kartın ön yüzü boş.
