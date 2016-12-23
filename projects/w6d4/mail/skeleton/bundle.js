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
	const Inbox = __webpack_require__(2);

	document.addEventListener("DOMContentLoaded", (e) => {
	  const sidebarLi = Array.from(document.querySelectorAll('.sidebar-nav li'));

	  sidebarLi.forEach((li) => {
	    li.addEventListener("click", (e2) => {
	      window.location.hash = li.innerText.toLowerCase();

	      const content = document.querySelector('.content');
	      const router = new Router(content, routes);
	      router.start();
	    });
	  });
	});

	const routes = {
	  inbox: Inbox
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	function Router(node, routes) {
	  this.node = node;
	  this.routes = routes;
	}

	Router.prototype.start = function() {
	  this.render();
	  document.addEventListener("hashchange", this.render.bind(this));
	};

	Router.prototype.activeRoute = function() {
	  return this.routes[window.location.hash.replace('#', '')];
	};

	Router.prototype.render = function() {
	  const component = this.activeRoute();

	  if (component) {
	    this.node.innerHTML = "";
	    this.node.appendChild(component.render());
	  } else {
	    this.node.innerHTML = "";
	  }
	};

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const Inbox = {
	  render: function() {
	    let ul = document.createElement('ul');
	    ul.className = "messages";
	    ul.innerHTML = "An Inbox Message";
	    return ul;
	  }
	};

	module.exports = Inbox;


/***/ }
/******/ ]);