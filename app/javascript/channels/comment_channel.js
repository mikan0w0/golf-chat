import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const html = `<div class="comment-top">
                    ${data.content.comment}
                  </div>
                  <div class="comment-low">
                    <ul class="comment-info">
                      <li>ユーザー名：${data.content.user_id}</li>
                      <li>コメント日時：${data.content.created_at}</li>
                    </ul>
                  </div>`;
    const comment = document.getElementById('show-comment')
    const newComment = document.getElementById('input-comment')
    comment.insertAdjacentHTML("afterbegin",html)
    newComment.value = '';
  }
});
