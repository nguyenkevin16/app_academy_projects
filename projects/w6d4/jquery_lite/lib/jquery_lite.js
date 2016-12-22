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

	const DOMNodeCollection = __webpack_require__(1);

	window.$l = function(arg) {
	  const nodeListArr = [];
	  const funcQueue = [];

	  if (typeof arg === 'string') {
	    const nodeList = document.querySelectorAll(arg);
	    nodeListArr = Array.prototype.slice.call(nodeList);
	  } else if (arg instanceof HTMLElement) {
	    nodeListArr.push(arg);
	  } else if (typeof arg === 'function') {
	    funcQueue.push(arg);
	  }

	  document.addEventListener("DOMContentLoaded", () => {
	    funcQueue.forEach((func) => {
	      func();
	    });
	  });

	  return new DOMNodeCollection(nodeListArr);
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(HTMLElements) {
	    this.elements = HTMLElements;
	  }

	  html(string = null) {
	    if (string !== null) {
	      this.elements.forEach((el) => { el.innerHTML = string; });
	    } else {
	      return this.elements[0].innerHTML;
	    }
	  }

	  empty() {
	    this.elements.forEach((el) => { el.innerHTML = ""; });
	  }

	  append(args) {
	    if (typeof args === 'string' || args instanceof HTMLElement) {
	      this.elements.forEach((el) => {
	        el.innerHTML += args;
	      });
	    } else {
	      args.elements.forEach((outer) => {
	        this.elements.forEach((inner) => {
	          inner.innerHTML += outer.outerHTML;
	        });
	      });
	    }
	  }

	  attr(attribute, value = "") {
	    if (value === "") {
	      return this.elements[0].getAttribute(attribute);
	    } else if (value === null) {
	      this.elements.forEach(el => {
	        el.removeAttribute(attribute);
	      });
	    } else {
	      this.elements.forEach((el) => {
	        el.setAttribute(attribute, value);
	      });
	    }
	  }

	  addClass(className) {
	    this.elements.forEach((el) => { el.className = className; });
	  }

	  removeClass() {
	    this.attr('class', null);
	  }

	  children() {
	    let allChildren = [];

	    this.elements.forEach((el) => {
	      Array.from(el.children).forEach((child) => allChildren.push(child));
	    });

	    return new DOMNodeCollection(allChildren);
	  }

	  parent() {
	    return new DOMNodeCollection(this.elements[0].parentNode);
	  }

	  find(selector) {
	    const els = Array.from(document.querySelectorAll(selector));
	    return new DOMNodeCollection(els);
	  }

	  remove(selector) {
	    this.elements.forEach((el) => {
	      el.innerHTML = "";
	      el.outerHTML = "";
	    });

	    this.elements = [];
	  }

	  on(type, callback) {
	    this.elements.forEach((el) => {
	      el.addEventListener(type, callback);
	      el.callback = callback;
	    });
	  }

	  off(type) {
	    this.elements.forEach((el) => {
	      el.removeEventListener(type, el.callback);
	    });
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);