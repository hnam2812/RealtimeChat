$(function() {
  $(".open-chatlog").on("click", function(e){
    e.preventDefault();
    $(this).next(".panel-body").toggle();
    var messages_list = $(this).next(".panel-body").find(".messages-list");
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  });

  //function enter to send
  $("#conversations-list").on("keypress", ".message-content", function(e){
    $form = $(this).closest(".new_message");
    $isEnter = $form.find(".enter-to-send");
    if($isEnter.prop("checked") && e.which == 13) {
      $form.submit();
    }
  });

  //save select enter to send in cookies
  $("#conversations-list").on("change", ".enter-to-send", function(e) {
    dataEnterToSend = Cookies.get("enterToSend") || "[]";
    dataEnterToSend = JSON.parse(dataEnterToSend);
    var convId = $(this).closest(".panel.panel-default").data("conversationId");
    var isEnter = $(this).prop("checked");
    var result = _.find(dataEnterToSend, {convId: convId});
    if(result)
      _.merge(result, {convId: convId, isEnter: isEnter});
    else
      dataEnterToSend.push({convId: convId, isEnter: isEnter});
    Cookies.set("enterToSend", dataEnterToSend);
  });

  //set enter to send from cookies data
  setEnterToSend();
});

function setEnterToSend() {
  var conversations = $("#conversations-list").find(".panel.panel-default");
  var dataEnterToSend = Cookies.get("enterToSend") || "[]";
  dataEnterToSend = JSON.parse(dataEnterToSend);

  conversations.each(function() {
    var convId = $(this).data("conversationId");
    var result  = _.find(dataEnterToSend, {convId: convId});
    $(this).find(".panel-body").show();
    if(result)
      $(this).find(".enter-to-send").prop("checked", result.isEnter);
  });

};
