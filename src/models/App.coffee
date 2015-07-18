# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    params =
      deck: @get 'deck'
      playerHand: @get 'playerHand'
      dealerHand: @get 'dealerHand'
    @set 'game', game = new Game(params)