const MessageStore = require('./message_store.js');

const Compose = {
  render: function() {
    let div = document.createElement('div');
    div.className = 'new-message';
    div.innerHTML = this.renderForm();

    div.addEventListener('change', function(e) {
      const field = e.target.name;
      const value = e.target.value;
      MessageStore.updateDraftField(field, value);
    });

    return div;
  },

  renderForm: function() {
    const messageDraft = MessageStore.getMessageDraft();

    const htmlString =
    `<p class="new-message-header">New Message</p>
      <form class="compose-form">
      <input placeholder="Recipient" name="to" type="text" value="${messageDraft.to}">
      <input placeholder="Subject" name="subject" type="text" value="${messageDraft.subject}">
      <textarea name="body" rows=20>${messageDraft.body}</textarea>
      <button type="submit" class="btn btn-primary submit-message">Send</button>
    </form>`;

    return htmlString;
  }
};


module.exports = Compose;
