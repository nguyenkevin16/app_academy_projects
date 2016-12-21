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
  }
};

module.exports = APIUtil;
