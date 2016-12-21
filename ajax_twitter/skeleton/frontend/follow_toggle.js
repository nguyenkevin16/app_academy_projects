const APIUtil = require('./api_util.js');

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
