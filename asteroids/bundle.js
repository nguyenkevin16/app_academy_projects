/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const asteroid = __webpack_require__(1);

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


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const utils = __webpack_require__(2);
	const movingObjects = __webpack_require__(3);

	function asteroid(pos) {

	  movingObjects.call(this, pos);

	  this.color = "red";
	  this.radius = 30;
	  this.vel = utils.randVec(5);
	}

	utils.inherits(asteroid, movingObjects);

	module.exports = asteroid;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate() {}
	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  // Return a randomly oriented vector with the given length.
	  randVec(length) {
	    const deg = 2 * Math.PI * Math.random();
	    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
	  },

	  // Scale the length of a vector by the given amount.
	  scale (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  }
	};


	module.exports = Util;


/***/ },
/* 3 */
/***/ function(module, exports) {

	function MovingObject(options) {
	  this.pos = options['pos'];
	  this.vel = options['vel'];
	  this.radius = options['radius'];
	  this.color = options['color'];
	}

	MovingObject.prototype.draw = function(ctx) {
	  ctx.fillStyle = this.color;
	  ctx.beginPath();

	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();
	};

	MovingObject.prototype.move = function() {
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	};

	module.exports = MovingObject;


/***/ }
/******/ ]);