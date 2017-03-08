App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
    conversation.find('.messages-list').find('ul').append(data['message']);

    var messages_list = conversation.find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  },

  chat: function(message) {
    return this.perform('chat', {
      message: message
    });
  }
});
$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  // var values = $(this).serializeArray();
  var conversation_id = $(this).find("input[name='conversation_id']").val();
  var body = $(this).find("textarea[name='body']").val();
  var values = {conversation_id: conversation_id, body: body};
  App.conversation.chat(values);
  $(this).trigger('reset');
});
