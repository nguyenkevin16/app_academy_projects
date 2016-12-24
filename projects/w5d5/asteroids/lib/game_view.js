const game = require('./game.js');

function GameView(ctx) {
  this.game = new game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  window.setInterval(() => {
    this.game.draw(this.ctx);
    this.game.moveObjects();
  }, 20);
};

module.exports = GameView;
