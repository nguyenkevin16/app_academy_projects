const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

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
