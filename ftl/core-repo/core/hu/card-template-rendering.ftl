### These messages are shown on the review screen, preview screen, and
### card template screen when the user has made a mistake in their card
### template, or the front of the card is empty.

# Label of link users can click on
card-template-rendering-more-info = További információ
card-template-rendering-front-side-problem = Az előlapsablon hibás:
card-template-rendering-back-side-problem = A hátlapsablon hibás:
# when the user forgot to close a field reference,
# eg, Missing '}}' in '{{Field'
card-template-rendering-no-closing-brackets = Hiányzik a '{ $missing }' - '{ $tag }'
# when the user opened a conditional, but forgot to close it
# eg, Missing '{{/Conditional}}'
card-template-rendering-conditional-not-closed = Hiányzik a '{ $missing }'
# when the user closed the wrong conditional
# eg, Found '{{/Something}}', but expected '{{/SomethingElse}}'
card-template-rendering-wrong-conditional-closed = '{ $expected }' helyett váratlan '{ $found }'.
# when the user closed a conditional that wasn't open
# eg, Found '{{/Something}}', but missing '{{#Something}}' or '{{^Something}}'
card-template-rendering-conditional-not-open = Talált '{ $found }', hiányzik '{ $missing1 }' vagy '{ $missing2 }'
# when the user referenced a field that doesn't exist
# eg, Found '{{Field}}', but there is not field called 'Field'
card-template-rendering-no-such-field = Talált '{ $found }', de nincs ilyen '{ $field }' mező
# This message is shown when the front side of the card is blank,
# either due to a badly-designed template, or because required fields
# are missing.
card-template-rendering-empty-front = A kártya előlapja üres.
