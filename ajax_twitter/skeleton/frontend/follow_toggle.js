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
    } else {
      this.$el.html("Unfollow!");
    }
  }

  handleClick(e) {
    e.preventDefault();

    if (this.followState === "unfollowed") {
      console.log("POST");
      this.toggleState();
      this.render();
      // $.ajax({
      //   type: "POST",
      //   url: `/users/${this.userId}/follow`,
      //   dataType: 'json',
      //
      //   success(button, toggleState, render) {
      //     toggleState(button);
      //     render();
      //     console.log(this);
      //   },
      //
      //   error: () => { console.log('error'); }
      // });
    } else {
      console.log("DELETE");
      this.toggleState();
      this.render();
      // $.ajax({
      //   type: "DELETE",
      //   url: `/users/${this.userId}/follow`,
      //   dataType: 'json',
      //
      //   success(button, toggleState, render) {
      //     toggleState(button);
      //     render();
      //     console.log(this);
      //   },
      //
      //   error: () => { console.log('error'); }
      // });
    }
  }

  toggleState(){
    console.log(this.followState === "followed");
    if (this.followState === "unfollowed"){
      this.$el.data('initial-follow-state', "followed");
    } else {
      this.$el.data('initial-follow-state', "unfollowed");
    }
  }
}

module.exports = FollowToggle;
