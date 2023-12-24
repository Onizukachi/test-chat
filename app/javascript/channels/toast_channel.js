import consumer from "./consumer"

consumer.subscriptions.create("ToastChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    document.querySelector('#audio').play()
  }
});
