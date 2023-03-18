// app/assets/javascripts/channels/chatroom_channel.js
import consumer from "./consumer"

class ChatroomChannel {
    static init() {
        consumer.subscriptions.create("ChatroomChannel", {
            connected() {},

            disconnected() {},

            received(data) {
                if (data.type === "chat_created") {
                    window.location.href = data.chatroom_path
                }
            }
        })
    }
}

export default ChatroomChannel
