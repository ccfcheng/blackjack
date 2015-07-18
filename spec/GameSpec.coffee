assert = chai.assert
expect = chai.expect
spy = chai.spy

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

  describe 'on stand events', ->
    describe 'for the player', ->
      beforeEach ->
        playerHand.stand()

      it 'Game receives the best score for player', ->
        expect(game.get('playerBestScore')).to.equal(playerHand.bestScore())

    describe 'for the dealer', ->
      beforeEach ->
        dealerHand.stand()

      it 'Game receives the best score for dealer', ->
        expect(game.get('dealerBestScore')).to.equal(dealerHand.bestScore())