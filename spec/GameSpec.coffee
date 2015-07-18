assert = chai.assert

describe 'Game Model', ->
  game = null
  deck = null
  playerHand = null
  dealerHand = null
  params = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()
    params =
      deck: deck
      playerHand: playerHand
      dealerHand: dealerHand
    game = new Game(params)

  describe 'init', ->
    it 'has a deck property', ->
      assert.strictEqual game.has('deck'), true
    it 'has a player hand property', ->
      assert.strictEqual game.has('playerHand'), true
    it 'has a dealer hand property', ->
      assert.strictEqual game.has('dealerHand'), true