# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
# Game has access to 'deck', 'playerHand', 'dealerHand'
class window.Game extends Backbone.Model

  initialize: ->
    @set 'playerBestScore', null
    @set 'dealerBestScore', null

    @get('playerHand').on 'add', =>
      # check if score > 21
      scores = @get('playerHand').scores()
      # if score[0] and score[1] > 21
      # if yes, set alert 'You Lose!'
      alert 'You Lose!' if (scores[0] > 21 && scores[1] > 21)

    @get('playerHand').on 'stand', (playerScore) =>
      @set 'playerBestScore', playerScore

      @get('dealerHand').reveal()

      # console.log('registered player stand')
      # access dealerHand's first card and run flip method
      # @get('dealerHand').at(0).flip()
      # scores = @get('dealerHand').scores()
      # if scores[0] < 17 or scores[1] < 18
      #   @get('dealerHand').hit()
      # else
      #   @get('dealerHand').stand()

    @get('dealerHand').on 'add', =>
      scores = @get('dealerHand').scores()
      if scores[0] < 17 or scores[1] < 18
        @get('dealerHand').hit()
      else
        @get('dealerHand').stand()

    @get('dealerHand').on 'stand', (dealerScore) =>
      @set 'dealerBestScore', dealerScore
      # playerScore is scores[1] unless scores[1] is > 21
      # playerScore = @get('playerHand').scores()
      # if playerScore[1] > 21
      #   playerBestScore = playerScore[0]
      # else
      #   playerBestScore = playerScore[1]

      # dealerScore = @get('dealerHand').scores()
      # if dealerScore[1] > 21
      #   dealerBestScore = dealerScore[0]
      # else
      #   dealerBestScore = dealerScore[1]

      # if dealerBestScore > 21
      #   alert 'You Win!'
      # else
      #   if playerBestScore < dealerBestScore
      #     alert 'You Lose!'
      #   else if playerBestScore > dealerBestScore
      #     alert 'You Win!'
      #   else
      #     alert 'You Tied!'

