/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	const UserSearch = __webpack_require__(3);
	
	$(() => {
	  $("button.follow-toggle").each((idx, el) => {
	    new FollowToggle(el);
	  });
	
	  $("nav.users-search").each((idx, el) => {
	    new UserSearch(el);
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
	class FollowToggle {
	  constructor(el) {
	    this.$el = $(el);
	    this.userId = this.$el.data("user-id");
	    this.followState = this.$el.data("initial-follow-state");
	
	    this.render();
	    this.$el.on('click', this.handleClick.bind(this));
	  }
	
	  handleClick(e) {
	    e.preventDefault();
	
	    if (this.followState === "unfollowed") {
	      APIUtil.followUser(this.userId, this.toggleStateAndRender.bind(this));
	    } else {
	      APIUtil.unfollowUser(this.userId, this.toggleStateAndRender.bind(this));
	    }
	
	    this.$el.prop('disabled', true);
	  }
	
	  toggleStateAndRender() {
	    this.toggleState();
	    this.render();
	  }
	
	  render() {
	    if (this.followState === "unfollowed") {
	      this.$el.html("Follow!");
	    } else if (this.followState === "followed") {
	      this.$el.html("Unfollow!");
	    }
	
	    this.$el.prop('disabled', false);
	  }
	
	  toggleState() {
	    if (this.followState === "unfollowed") {
	      this.followState = "followed";
	    } else {
	      this.followState = "unfollowed";
	    }
	  }
	}
	
	module.exports = FollowToggle;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const APIUtil = {
	  followUser(id, success) {
	    $.ajax({
	      type: "POST",
	      url: `/users/${id}/follow`,
	      dataType: 'json',
	      success: success
	    });
	  },
	
	  unfollowUser(id, success) {
	    $.ajax({
	      type: "DELETE",
	      url: `/users/${id}/follow`,
	      dataType: 'json',
	      success: success
	    });
	  },
	
	  searchUsers(queryVal, success) {
	    $.ajax({
	      url: `/users/search`,
	      dataType: 'json',
	      data: {
	        query: queryVal
	      },
	
	      success: success
	    });
	  }
	};
	
	module.exports = APIUtil;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	const FollowToggle = __webpack_require__(1);
	
	class UsersSearch {
	  constructor(el) {
	    this.$el = $(el);
	    this.input = this.$el.find('input');
	    this.ul = this.$el.find('ul');
	
	    console.log(this.$el);
	    console.log(this.input);
	    console.log(this.ul);
	
	    this.input.on('input', this.handleInput.bind(this));
	  }
	
	  handleInput() {
	    APIUtil.searchUsers(this.input.val(), this.renderResults.bind(this));
	  }
	
	  renderResults(users) {
	    this.ul.empty();
	
	    users.forEach((user) => {
	      let userLink = `<a href="/users/${user.id}">${user.username}</a>`;
	      let button = `<button class=follow-toggle> </button>`;
	      this.ul.append(`<li>${userLink} ${button}</li>`);
	
	      new FollowToggle(this.$el.find('button.follow-toggle'));
	    });
	  }
	}
	
	module.exports = UsersSearch;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map