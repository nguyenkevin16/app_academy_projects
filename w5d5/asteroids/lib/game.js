const asteroid = require('./asteroid.js');

function Game () {
  this.DIM_X = window.innerWidth;
  this.DIM_Y = window.innerHeight;
  this.NUM_ASTEROIDS = 10;

  this.asteroids = [];

  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    let new_astroid = new asteroid({pos: this.randomPosition(), game: this});
    this.asteroids.push(new_astroid);
  }
};

Game.prototype.randomPosition = function() {
  const x = Math.random() * this.DIM_X;
  const y = Math.random() * this.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach((ast) => ast.draw(ctx));
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((ast) => ast.move());
};

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];

  if (pos[0] > this.DIM_X) {
    x = 0;
  } else if (pos[0] < 0) {
    x = this.DIM_X;
  }
  if (pos[1] > this.DIM_Y) {
    y = 0;
  } else if (pos[1] < 0) {
    y = this.DIM_Y;
  }

  return [x,y];
};

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    let firstAsteroid = this.asteroids[i];
    for (let j = 0; j < this.asteroids.length; j++) {
      if (j === i) {
        continue;
      } else if (firstAsteroid.isCollidedWith(this.asteroids[j])){
        alert("COLLISION");
      }
    }
  })
}

module.exports = Game;
