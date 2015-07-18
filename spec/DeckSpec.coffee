assert = chai.assert
expect = chai.expect

describe 'Deck', ->
  deck = null
  hand = null
  newHand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'constructor', ->
    it "should create a card collection", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

  # move to HandSpec when we are ready, belongs there
  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'deal Player', ->
    it "creates a new hand and returns it", ->
      expect(hand).to.be.an.instanceof(Hand)

  describe 'deal Dealer', ->

    beforeEach ->
      newHand = deck.dealDealer()

    it "creates a new hand and returns it", ->
      expect(newHand).to.be.an.instanceof(Hand)