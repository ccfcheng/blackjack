assert = chai.assert
expect = chai.expect

describe 'Hand Model', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'init', ->
    it 'player hand has a deck property', ->
      expect(playerHand.deck).to.be.equal(deck)
    it 'dealer hand has a deck property', ->
      expect(dealerHand.deck).to.be.equal(deck)
    it 'isDealer property is true for dealer hand', ->
      expect(dealerHand.isDealer).to.be.true
    it 'isDealer property is false for player hand', ->
      expect(playerHand.isDealer).to.be.false
    it 'The hand has an automate function', ->
      expect(playerHand.automate).to.be.a('function')

  describe 'On the start of the the dealer turn', ->
    it 'runs reveal method on dealer hand'
      # boundFunc = dealerHand.reveal.bind(dealerHand)
      # spy = chai.spy(boundFunc)
      # spy()
      # expect(spy).to.have.been.called()

    it 'calls the automate function for the first time'

  describe 'Dealer turn automation function', ->
    it 'Hit if dealer score is less than 17 without an Ace', ->
      card1 = new Card rank:5, suit:2
      card2 = new Card rank:8, suit:2
      dealerHand = new Hand [card1, card2], deck, true
      expect(dealerHand.length).to.equal(2)
      dealerHand.automate()
      expect(dealerHand.length).to.be.above(2)

    it 'Stand if dealer score is 17 or above without an Ace', ->
      card1 = new Card rank:9, suit:2
      card2 = new Card rank:8, suit:2
      dealerHand = new Hand [card1, card2], deck, true
      expect(dealerHand.length).to.equal(2)
      dealerHand.automate()
      expect(dealerHand.length).to.equal(2)

    it 'Hit if dealer score is less than 18 with an Ace', ->
      card1 = new Card rank:1, suit:2
      card2 = new Card rank:6, suit:2
      dealerHand = new Hand [card1, card2], deck, true
      expect(dealerHand.length).to.equal(2)
      dealerHand.automate()
      expect(dealerHand.length).to.be.above(2)

    it 'Stand if dealer score is 18 or above with an Ace', ->
      card1 = new Card rank:1, suit:2
      card2 = new Card rank:7, suit:2
      dealerHand = new Hand [card1, card2], deck, true
      expect(dealerHand.length).to.equal(2)
      dealerHand.automate()
      expect(dealerHand.length).to.equal(2)

