import 'package:flutter/material.dart';



class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true, // To show the latest message at the bottom
              children: [
                // Messages

                ChatMessage(
                  isUser: true,
                  text: 'I am a lawyer. Can you please provide details about your case?',
                ),
                ChatMessage(isUser: false, text: 'Hello!'),
                ChatMessage(isUser: true, text: 'Hi there!'),
                ChatMessage(isUser: false, text: 'How are you?'),
                ChatMessage(isUser: true, text: 'I\'m good. Thanks!'),

                // Add more messages here
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement sending a message here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String text;

  ChatMessage({
    required this.isUser,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
