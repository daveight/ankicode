### These messages are shown on the review screen, preview screen, and
### card template screen when the user has made a mistake in their card
### template, or the front of the card is empty.

# Label of link users can click on
card-template-rendering-more-info = Mere information
card-template-rendering-front-side-problem = Forside-skabelonet har et problem:
card-template-rendering-back-side-problem = Bagside-skabelonet har et problem:
card-template-rendering-browser-front-side-problem = Browser-specifik forside-skabelon har et problem:
card-template-rendering-browser-back-side-problem = Browser-specifik bagside-skabelon har et problem:
# when the user forgot to close a field reference,
# eg, Missing '}}' in '{{Field'
card-template-rendering-no-closing-brackets = Manglende '{ $missing }' i '{ $tag }'
# when the user opened a conditional, but forgot to close it
# eg, Missing '{{/Conditional}}'
card-template-rendering-conditional-not-closed = Manglende '{ $missing }'
# when the user closed the wrong conditional
# eg, Found '{{/Something}}', but expected '{{/SomethingElse}}'
card-template-rendering-wrong-conditional-closed = Fandt '{ $found }', men forventede '{ $expected }'
# when the user closed a conditional that wasn't open
# eg, Found '{{/Something}}', but missing '{{#Something}}' or '{{^Something}}'
card-template-rendering-conditional-not-open = Fandt '{ $found }', men mangler '{ $missing1 }' eller '{ $missing2 }'
# when the user referenced a field that doesn't exist
# eg, Found '{{Field}}', but there is not field called 'Field'
card-template-rendering-no-such-field = Fandt '{ $found }', men det findes ikke et felt ved navn '{ $field }'
# This message is shown when the front side of the card is blank,
# either due to a badly-designed template, or because required fields
# are missing.
card-template-rendering-empty-front = Forsiden på det her kort et tomt.
card-template-rendering-missing-cloze = Ingen cloze { $number } fundet på kort.
