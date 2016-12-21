class followToggle {
  constructor(el) {
    this.$el = $(el);
    this.user_id = this.$el.attr("data-user-id");
    this.followState = this.$el.attr("data-follow-state");
  }

}


module.exports = followToggle;
