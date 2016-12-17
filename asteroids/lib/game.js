const asteroid = require('./asteroid.js');

const canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
const ctx = canvasEl.getContext("2d");

function Game () {
  this.DIM_X = window.innerWidth;
  this.DIM_Y = window.innerHeight;
  this.NUM_ASTEROIDS = 10;

  this.asteroids = [];

  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    let new_astroid = new asteroid({pos: this.randomPosition()});
    this.asteroids.push(new_astroid);
  }
};

Game.prototype.randomPosition = function() {
  const x = Math.random() * this.DIM_X;
  const y = Math.random() * this.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function(ctx3) {
  ctx3.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach((ast) => ast.draw(ctx3));
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((ast) => ast.move());
};

let game = new Game();
game.draw(ctx);
game.moveObjects();
