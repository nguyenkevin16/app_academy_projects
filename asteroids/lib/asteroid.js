const utils = require("./utils.js");
const movingObjects = require("./moving_object.js");

const canvasEl = document.getElementsByTagName("canvas")[0];
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;

const ctx = canvasEl.getContext("2d");

function asteroid(pos) {

  movingObjects.call(this, pos);

  this.color = "red";
  this.radius = 30;
  this.vel = utils.randVec(5);
}

utils.inherits(asteroid, movingObjects);
