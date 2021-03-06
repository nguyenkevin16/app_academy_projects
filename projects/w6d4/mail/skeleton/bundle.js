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
	const Sent = __webpack_require__(4);
	const Compose = __webpack_require__(5);

	document.addEventListener("DOMContentLoaded", (e) => {
	  const sidebarLi = Array.from(document.querySelectorAll('.sidebar-nav li'));

	  sidebarLi.forEach((li) => {
	    li.addEventListener("click", (e2) => {
	      window.location.hash = li.innerText.toLowerCase();
	    });
	  });

	  const content = document.querySelector('.content');
	  const router = new Router(content, routes);
	  router.start();
	  location.hash = "inbox";
	});

	const routes = {
	  inbox: Inbox,
	  sent: Sent,
	  compose: Compose
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
	  document.addEventListener("click", this.render.bind(this));
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
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	const Inbox = {
	  render: function() {
	    let ul = document.createElement('ul');
	    ul.className = "messages";

	    MessageStore.getInboxMessages().forEach((message) => {
	      ul.appendChild(this.renderMessage(message));
	    });

	    return ul;
	  },

	  renderMessage: function(message) {
	    let li = document.createElement('li');
	    li.className = 'message';
	    li.innerHTML = `<span class="from">${message.from}</span>
	      <span class="subject">${message.subject}</span>
	      <span class="body">${message.body}</span>`;
	    return li;
	  }
	};

	module.exports = Inbox;


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {
	  sent: [
	    {to: "friend@mail.com", subject: "Check this out", body: "It's so cool"},
	    {to: "person@mail.com", subject: "zzz", body: "so booring"}
	  ],

	  inbox: [
	    { from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out",
	      body: "Stay at home mom discovers cure for leg cramps. Doctors hate her" },
	    { from: "person@mail.com", subject: "Questionnaire",
	      body: "Take this free quiz win $1000 dollars" }
	  ]
	};

	const MessageStore = {
	  getInboxMessages: function() {
	    return messages.inbox;
	  },

	  getSentMessages: function() {
	    return messages.sent;
	  },

	  getMessageDraft: function() {
	    return messageDraft;
	  },

	  updateDraftField: function(field, value) {
	    messageDraft.field = value;
	  },

	  sendDraft: function() {
	    messages.sent.push(messageDraft);
	    messageDraft = new Message();
	  }
	};

	function Message(from, to, subject, body) {
	  this.from = from;
	  this.to = to;
	  this.subject = subject;
	  this.body = body;
	}

	const messageDraft = new Message();

	module.exports = MessageStore;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	const Sent = {
	  render: function() {
	    let ul = document.createElement('ul');
	    ul.className = "messages";

	    MessageStore.getSentMessages().forEach((message) => {
	      ul.appendChild(this.renderMessage(message));
	    });

	    return ul;
	  },

	  renderMessage: function(message) {
	    let li = document.createElement('li');
	    li.className = 'message';
	    li.innerHTML = `<span class="to">${message.to}</span>
	      <span class="subject">${message.subject}</span>
	      <span class="body">${message.body}</span>`;
	    return li;
	  }
	};

	module.exports = Sent;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	const Compose = {
	  render: function() {
	    let div = document.createElement('div');
	    div.className = 'new-message';
	    div.innerHTML = this.renderForm();

	    div.addEventListener('change', function(e) {
	      const field = e.target.name;
	      const value = e.target.value;
	      MessageStore.updateDraftField(field, value);
	    });

	    return div;
	  },

	  renderForm: function() {
	    const messageDraft = MessageStore.getMessageDraft();

	    const htmlString =
	    `<p class="new-message-header">New Message</p>
	      <form class="compose-form">
	      <input placeholder="Recipient" name="to" type="text" value="${messageDraft.to}">
	      <input placeholder="Subject" name="subject" type="text" value="${messageDraft.subject}">
	      <textarea name="body" rows=20>${messageDraft.body}</textarea>
	      <button type="submit" class="btn btn-primary submit-message">Send</button>
	    </form>`;

	    return htmlString;
	  }
	};


	module.exports = Compose;


/***/ }
/******/ ]);