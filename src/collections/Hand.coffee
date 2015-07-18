class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    last = @deck.pop()
    @add(last)
    last

  stand: ->
    @trigger 'stand', @bestScore()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  bestScore: ->
    if @scores()[1] < 22
      @scores()[1]
    else
      @scores()[0]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  reveal: ->
    @at(0).flip()

  automate: ->
    if @hasAce()
      if @scores()[1] < 18
        @hit()
      else
        @stand()
    else
      if @scores()[0] < 17
        @hit()
      else
        @stand()
