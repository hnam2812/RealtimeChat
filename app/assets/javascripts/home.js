$(function() {
  $("#conversations-list").on("click",".open-chatlog", function(e){
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

  $(".comment-content").keypress(function(e) {
    if(e.which == 13) {
      e.preventDefault();
      $(this).closest("form").submit();
    }
  });

  $('[data-toggle="popover"]').popover();
  $(".relationship-popup").popover({ trigger: "manual" , html: true, animation: false})
    .on("mouseenter", function () {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
    }).on("mouseleave", function () {
      var _this = this;
      setTimeout(function () {
          if (!$(".popover:hover").length) {
              $(_this).popover("hide");
          }
      }, 50);
  });
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
  conversations.find(".panel-body").hide().last().show();
};
