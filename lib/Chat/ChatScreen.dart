import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {"sender": "user", "text": "Hi there! How are you?"},
    {"sender": "bot", "text": "Hello! I'm doing well, thank you. How can I help you today?"},
    {"sender": "user", "text": "I'm looking for some advice."},
    {"sender": "bot", "text": "Sure! What kind of advice are you looking for?"},
    {"sender": "user", "text": "Just some tips on designing chat interfaces."},
    {"sender": "bot", "text": "I'd be happy to help with that!"}
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat",style: customText(20, Colors.white, FontWeight.bold),),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['sender'] == 'user';

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.orange.shade200 : Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: isUser ? Radius.circular(12) : Radius.circular(0),
                        bottomRight: isUser ? Radius.circular(0) : Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () async {
                      // To save a key-value pair
                      SharedPreferences pref=await SharedPreferences.getInstance();
                      pref.setString("key", "value");
                      var data= pref.getString("key");
                      debugPrint(data);
                      // await HelperClass.saveString("username", "JohnDoe");
                      //
                      // String? username = await HelperClass.getString("username");
                      // print(username); // Output: JohnDoe (if saved)

                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}