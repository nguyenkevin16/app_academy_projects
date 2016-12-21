class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.html("Follow!");
    } else if (this.followState === "followed") {
      this.$el.html("Unfollow!");
    }
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "unfollowed") {
      $.ajax({
        type: "POST",
        url: `/users/${this.userId}/follow`,
        dataType: 'json',

        success: (data) => { toggleStateAndRender(data); },
        error: () => { console.log('Follow Error'); }
      });
    } else {
      $.ajax({
        type: "DELETE",
        url: `/users/${this.userId}/follow`,
        dataType: 'json',

        success: (data) => { toggleStateAndRender(data); },
        error: () => { console.log('Unfollow Error'); }
      });
    }

    const toggleStateAndRender = (data) => {
      this.toggleState();
      this.render();
    };
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
