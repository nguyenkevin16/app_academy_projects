Function.prototype.inherits = function(parent) {
  let child = this;

  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
  child.prototype.constructor = child;
};

function MovingObject () {}
MovingObject.prototype.me = function() {
  console.log("I am a moving object.");
};

function Ship () {}
Ship.inherits(MovingObject);
Ship.prototype.sh = function() {
  console.log("I am a ship.");
};

function Asteroid () {}
Asteroid.inherits(MovingObject);
Asteroid.prototype.fly = function() {
  console.log("I can fly");
};

let mo = new MovingObject();
let s = new Ship();
let a = new Asteroid();

mo.me();
// mo.ship();

s.me();
s.sh();

a.me();
a.fly();
