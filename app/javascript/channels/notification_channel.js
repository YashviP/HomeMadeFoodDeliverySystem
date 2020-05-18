import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    if(data.action == "new_notification"){
      console.log(data);
      var notification_bell = $("#unviewed_notifications");
      notification_bell.css("display", "block");
      notification_bell.attr("unviewed_count", data.unseen_count);
      notification_bell.text(data.unseen_count);
    }
  }
});