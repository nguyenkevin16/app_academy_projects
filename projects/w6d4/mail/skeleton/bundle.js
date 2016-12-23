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

	const Router = __webpack_require__(1);

	document.addEventListener("DOMContentLoaded", (e) => {
	  const sidebarLi = Array.from(document.querySelectorAll('.sidebar-nav li'));

	  sidebarLi.forEach((li) => {
	    li.addEventListener("click", (e2) => {
	      window.location.hash = li.innerText.toLowerCase();

	      const content = document.querySelector('.content');
	      const router = new Router(content);
	      router.start();
	    });
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	function Router(node) {
	  this.node = node;
	}

	Router.prototype.start = function() {
	  this.render();
	  document.addEventListener("hashchange", this.render.bind(this));
	};

	Router.prototype.activeRoute = function() {
	  return (window.location.hash.replace('#', ''));
	};

	Router.prototype.render = function() {
	  this.node.innerHTML = "";
	  let newEl = document.createElement('p');
	  newEl.innerHTML = this.activeRoute();
	  this.node.appendChild(newEl);
	};

	module.exports = Router;


/***/ }
/******/ ]);