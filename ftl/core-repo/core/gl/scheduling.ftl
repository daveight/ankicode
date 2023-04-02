scheduling-time-span-seconds =
    { $amount ->
        [one] { $amount } segundo
       *[other] { $amount } segundos
    }
scheduling-time-span-minutes =
    { $amount ->
        [one] { $amount } minuto
       *[other] { $amount } minutos
    }
scheduling-time-span-hours =
    { $amount ->
        [one] { $amount } hora
       *[other] { $amount } horas
    }
scheduling-time-span-days =
    { $amount ->
        [one] { $amount } día
       *[other] { $amount } días
    }
scheduling-time-span-months =
    { $amount ->
        [one] { $amount } mes
       *[other] { $amount } meses
    }
scheduling-time-span-years =
    { $amount ->
        [one] { $amount } ano
       *[other] { $amount } anos
    }
scheduling-congratulations-finished = Parabéns! Rematou este feixe polo de agora.
scheduling-today-review-limit-reached =
    O límite de revisión para hoxe foi acadado, pero aínda hai cartas
    pendentes de ser revisadas. Para unha óptima memoria, considere
    incrementar o límite diario nas opcións.
scheduling-today-new-limit-reached =
    Hai máis cartas dispoñíbeis pero o límite diario foi sobrepasado.
    Pode incrementar o límite nas opción, pero por favor,
    teña en mente que cantas máis cartas introduza, máis alta
    será a súa carga de traballo a curto prazo.
scheduling-buried-cards-were-delayed = Algunhas cartas relacionadas ou soterradas foron atrasadas ata unha sesión posterior.
scheduling-at-least-one-step-is-required = Requirese polo menos  un paso.
scheduling-automatically-play-audio = Reproducir o son automaticamente
scheduling-bury-related-new-cards-until-the = Descarta as novas tarxetas relacionadas ata o día seguinte
scheduling-bury-related-reviews-until-the-next = Soterrar as revisións relativas ata o próximo día.
scheduling-days = días
scheduling-description = Descrición
scheduling-easy-bonus = Bonus por seren fácil
scheduling-easy-interval = Intervalo para fácil
scheduling-end = (fin)
scheduling-general = Xeral
scheduling-graduating-interval = Intervalo para pasar
scheduling-ignore-answer-times-longer-than = Ignorar os tempos de resposta maiores de
scheduling-interval-modifier = Modificador do intervalo
scheduling-lapses = Períodos
scheduling-lapses2 = períodos
scheduling-learning = Aprendendo
scheduling-leech-action = Acción de samesugas
scheduling-leech-threshold = Limiar para samesugas
scheduling-maximum-interval = Intervalo máximo
scheduling-maximum-reviewsday = Repasos máximo/día
scheduling-minimum-interval = Intervalo mínimo
scheduling-mix-new-cards-and-reviews = Misturar tarxetas novas e repasos
scheduling-new-cards = Novas tarxetas
scheduling-new-cardsday = Tarxetas novas/día
scheduling-new-interval = Intervalo novo
scheduling-new-options-group-name = Nome do novo grupo de opcións:
scheduling-options-group = Grupo de opcións:
scheduling-order = Orde
scheduling-parent-limit = (límite anterior: { $val })
scheduling-review = Repaso
scheduling-reviews = Repasos
scheduling-seconds = segundos
scheduling-set-all-decks-below-to = Definir todos os feixes de embaixo { $val } con este grupo de opcións?
scheduling-set-for-all-subdecks = Definir para fotos os feixes secundarios
scheduling-show-answer-timer = Amosar o temporizador de respostas
scheduling-show-new-cards-after-reviews = Amosar as novas tarxetas despois dos repasos
scheduling-show-new-cards-before-reviews = Amosar as novas tarxetas antes dos repasos
scheduling-show-new-cards-in-order-added = Amosar as novas tarxetas na orde engadida
scheduling-show-new-cards-in-random-order = Amosar as novas tarxetas ao chou
scheduling-starting-ease = Facilidade inicial
scheduling-steps-in-minutes = Pasos (en minutos)
scheduling-steps-must-be-numbers = Os pasos deben ser números.
scheduling-tag-only = Só as etiquetas
scheduling-the-default-configuration-cant-be-removed = A configuración predeterminada non pode ser retirada.
scheduling-your-changes-will-affect-multiple-decks = Os seus cambios afectarán a varios feixes. Se quere cambiar unicamente o feixe actual, engada primeiro un novo grupo de opcións.
scheduling-deck-updated = { $count ->
    [one] { $count } feixe actualizado.
   *[other] { $count } feixes actualizados.
  }
