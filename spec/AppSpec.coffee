assert = chai.assert

describe 'AppModel', ->
  app = null

  beforeEach ->
    app = new App()

  describe 'init', ->
    it 'creates a deck ', ->
      assert.strictEqual app.has('deck'), true
    it 'creates a player hand', ->
      assert.strictEqual app.has('playerHand'), true
    it 'creates a dealer hand', ->
      assert.strictEqual app.has('dealerHand'), true
    it 'creates a new game', ->
      assert.strictEqual app.has('game'), true