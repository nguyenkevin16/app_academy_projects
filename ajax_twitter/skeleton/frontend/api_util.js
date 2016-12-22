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
  }
};

module.exports = APIUtil;
