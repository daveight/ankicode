scheduling-time-span-seconds =
    { $amount ->
        [one] { $amount } δευτερόλεπτο
       *[other] { $amount } δευτερόλεπτα
    }
scheduling-time-span-minutes =
    { $amount ->
        [one] { $amount } λεπτό
       *[other] { $amount } λεπτά
    }
scheduling-time-span-hours =
    { $amount ->
        [one] { $amount } ώρα
       *[other] { $amount } ώρες
    }
scheduling-time-span-days =
    { $amount ->
        [one] { $amount } ημέρα
       *[other] { $amount } ημέρες
    }
scheduling-time-span-months =
    { $amount ->
        [one] { $amount } μήνας
       *[other] { $amount } μήνες
    }
scheduling-time-span-years =
    { $amount ->
        [one] { $amount } χρόνο
       *[other] { $amount } χρόνια
    }
scheduling-congratulations-finished = Συγχαρητηρία! Ολοκληρώσατε αυτή την τράπουλα για την ώρα.
scheduling-at-least-one-step-is-required = Τουλάχιστον ένα βήμα απαιτείται.
scheduling-automatically-play-audio = Αυτόματη ενεργοποίηση ήχου
scheduling-days = ημέρες
scheduling-description = Περιγραφή
scheduling-easy-bonus = Εύκολο bonus
scheduling-end = (τέλος)
scheduling-general = Γενικά
scheduling-ignore-answer-times-longer-than = Αγνόησε απαντήσεις μεγαλύτερες από
scheduling-learning = Εκμάθηση
scheduling-new-cards = Νέες Κάρτες
scheduling-review = Επιθεώρηση
scheduling-reviews = Επιθεωρήσεις
scheduling-seconds = δευτερόλεπτα
scheduling-steps-in-minutes = Βήματα (σε λεπτά)
scheduling-steps-must-be-numbers = Βήματα πρέπει να είναι αριθμοί.
scheduling-tag-only = Ετικέτα μόνο
scheduling-deck-updated = { $count ->
    [one] { $count } τράπουλα ενημερώθηκε.
   *[other] { $count } τράπουλες ενημερώθηκαν.
  }
