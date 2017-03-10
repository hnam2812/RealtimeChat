$(function() {
  $("#conversations-list").on("click", ".btn-close", function(e){
    e.preventDefault();
    $(this).closest("li").remove();
  });

  $(".open-chatlog").on("click", function(e){
    e.preventDefault();
    $(this).next(".panel-body").toggle();
    var messages_list = $(this).next(".panel-body").find('.messages-list');
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  });
});
