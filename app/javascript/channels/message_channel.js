import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var today = new Date();
    var month = today.getMonth() + 1;
    var day = today.getDate();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var d =  month + '/' + day + ' ' + hour + ':' + minute;

    const html = `
    <div class="post" id="posts_data">
      <div class="top-post">
        <div class="post-name">
          <div class="name_in">${data.user.nickname}</div>
        </div>
        <div class="post-content">
          ${data.content.content}
        </div>
        <div class="post-date">
          ${d}
        </div>
      </div>
    </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
    const messagesArea = document.getElementById('scroll');
    messagesArea.scrollTop = messagesArea.scrollHeight;
  }
});
