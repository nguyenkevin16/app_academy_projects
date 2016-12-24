const APIUtil = require('./api_util.js');

class TweetCompose {
  constructor() {
    this.form = $('.tweet-compose');
    this.inputs = this.form.find(':input');
    this.ul = $(`${this.form.data('tweets-ul')}`);

    console.log(this.inputs);

    this.form.on("submit", this.submit.bind(this));
  }

  submit(e) {
    e.preventDefault();
    let formData = $(e.currentTarget).serializeJSON();

    APIUtil.createTweet(formData, this.handleSuccess.bind(this));
    this.inputs.prop('disabled', true);
  }

  handleSuccess(tweet) {
    // this.inputs.find('textarea').val("");
    this.inputs.prop('disabled', false);

    let $tweet = $(`<li>${tweet.content}</li>`);
    this.ul.append($tweet);
  }
}

module.exports = TweetCompose;
