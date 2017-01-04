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
  },

  createTweet(data, success) {
    $.ajax({
      method: 'POST',
      url: '/tweets',
      dataType: 'json',
      data: data,
      success: success
    });
  }
};

module.exports = APIUtil;
