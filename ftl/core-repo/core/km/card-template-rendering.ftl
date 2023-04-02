### These messages are shown on the review screen, preview screen, and
### card template screen when the user has made a mistake in their card
### template, or the front of the card is empty.

# Label of link users can click on
card-template-rendering-more-info = ព័ត៌មាន​បន្ថែម
card-template-rendering-front-side-problem = គំរូខាងមុខមានបញ្ហា
card-template-rendering-back-side-problem = គំរូខាងក្រោយមានបញ្ហា
# when the user forgot to close a field reference,
# eg, Missing '}}' in '{{Field'
card-template-rendering-no-closing-brackets = រកមិនឃើញ { $missing } ក្នុង { $tag }
# when the user opened a conditional, but forgot to close it
# eg, Missing '{{/Conditional}}'
card-template-rendering-conditional-not-closed = រកមិនឃើញ { $missing }
# when the user closed the wrong conditional
# eg, Found '{{/Something}}', but expected '{{/SomethingElse}}'
card-template-rendering-wrong-conditional-closed = រកឃើញ '{ $found }', ប៉ុន្តែតម្រូវឲ្យមាន '{ $expected }'
# when the user closed a conditional that wasn't open
# eg, Found '{{/Something}}', but missing '{{#Something}}' or '{{^Something}}'
card-template-rendering-conditional-not-open = រកឃើញ { $found }, ប៉ុន្តែរកមិនឃើញ  { $missing1 } ឬ { $missing2 }
# when the user referenced a field that doesn't exist
# eg, Found '{{Field}}', but there is not field called 'Field'
card-template-rendering-no-such-field = រកឃើញ{ $found } ប៉ុន្តែមិនមែនកន្លែងសម្រាប់ដាក់{ $field }
# This message is shown when the front side of the card is blank,
# either due to a badly-designed template, or because required fields
# are missing.
card-template-rendering-empty-front = ផ្នែកខាងមុខនៃកាតនេះមិនមានអក្សរ
card-template-rendering-missing-cloze =
    មិនមានខ្លូស{ $number }នៅលើកាត
    សុំលុបខ្លូស ឬប្រើឧបករណ៍ ការទទេរ
