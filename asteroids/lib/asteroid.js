const utils = require("./utils.js");
const movingObjects = require("./moving_object.js");

function asteroid(pos) {

  movingObjects.call(this, pos);

  this.color = "red";
  this.radius = 30;
  this.vel = utils.randVec(5);
}

utils.inherits(asteroid, movingObjects);

module.exports = asteroid;
