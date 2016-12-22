const FollowToggle = require("./follow_toggle.js");
const UserSearch = require("./users_search.js");
const TweetCompose = require("./tweet_compose.js");

$(() => {
  $("button.follow-toggle").each((idx, el) => {
    new FollowToggle(el);
  });

  $("nav.users-search").each((idx, el) => {
    new UserSearch(el);
  });

  new TweetCompose();
});
