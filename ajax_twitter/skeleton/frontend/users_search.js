const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.find('input');
    this.ul = this.$el.find('ul.users');

    this.input.on('input', this.handleInput.bind(this));
  }

  handleInput() {
    APIUtil.searchUsers(this.input.val(), this.renderResults.bind(this));
  }

  renderResults(users) {
    this.ul.empty();

    users.forEach((user) => {
      let userLink = `<a href="/users/${user.id}">${user.username}</a>`;
      let button = `<button class=follow-toggle></button>`;

      function followed() { return user.followed ? "followed" : "unfollowed"; }

      let options = {
        userId: user.id,
        followState: followed()
      };

      this.ul.append(`<li>${userLink} ${button}</li>`);

      const $lastLi = this.ul.find('li:last-of-type');
      const $lastButton = $lastLi.find('button');

      new FollowToggle($lastButton, options);
    });
  }
}

module.exports = UsersSearch;
