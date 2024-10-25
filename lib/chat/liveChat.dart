import 'package:flutter/material.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final List<String> emojis = ['❤️', '😂', '🔥', '👍', '👏'];
  List<Map<String, String>> comments = [];
  TextEditingController commentController = TextEditingController();
  Color blue = const Color.fromRGBO(54, 40, 221, 1.0);

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'profileImage': 'assets/images/homeImage.png',
        });
        _messageController.clear();
      });
    }
  }

  void addComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        comments.add({
          'name': 'Your Name',
          'time': 'Just now',
          'comment': commentController.text,
          'profileImage': 'assets/images/homeImage.png'
        });
        commentController.clear();
      });
    }
  }

  void showCommentPopup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      const Text("Comments",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      const Divider(color: Colors.black, thickness: 2),
                      Expanded(
                        child: ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    comments[index]['profileImage']!),
                              ),
                              title: Row(children: [
                                Text('${comments[index]['name']} ',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                Text('${comments[index]['time']}',
                                    style: const TextStyle(fontSize: 10)),
                              ]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(comments[index]['comment']!),
                                  const Text('Reply',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              trailing: const Icon(Icons.favorite_border),
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/homeImage.png'),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              controller: commentController,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                hintText: ' Add a Reply',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(54, 40, 221, 1.0),
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(54, 40, 221, 1.0),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(54, 40, 221, 1.0),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Send button
                          GestureDetector(
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                  color: Color.fromRGBO(54, 40, 221, 1.0)),
                            ),
                            onTap: () {
                              addComment();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey[900],
              child: const Center(
                child: Text(
                  'Live Video Stream', // live video would go here
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),

          Positioned(
            left: 10,
            bottom: 90,
            child: SizedBox(
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add vertical spacing
                    child: Row(
                      children: [
                        // profile image should also change based on user
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage(_messages[index]['profileImage']!),
                        ),
                        const SizedBox(width: 10),
                        // Display the message
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              _messages[index]['text']!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
              right: 40,
              bottom: 130,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/homeImage.png'),
                  ),
                  const SizedBox(height: 5),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite,
                          color: Colors.white, size: 30)),
                  const SizedBox(height: 5),
                  IconButton(
                      onPressed: () {
                        showCommentPopup(context);
                      },
                      icon: const Icon(Icons.insert_comment,
                          color: Colors.white, size: 30))
                ],
              )),

          // Comment Input Box
          Positioned(
            bottom: 30,
            left: 10,
            right: 30,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[800],
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
                IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.thumb_up_sharp,
                      color: Color.fromARGB(255, 192, 173, 2)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
