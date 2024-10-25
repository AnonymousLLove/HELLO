import 'package:flutter/material.dart';
import 'package:love_bird/chat/mainChat.dart';
import 'package:love_bird/chat/videoCall.dart';
import 'package:love_bird/chat/voiceCall.dart';
import 'package:love_bird/edit%20profile%20screens/edit_low_profile_screen.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/homeScreen/notification.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String profileImage;
  final bool isOnline;

  const ChatDetailScreen({
    Key? key,
    required this.name,
    required this.profileImage,
    this.isOnline = false,
  }) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // List to store messages
  String selectedOption = '';
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'message': _messageController.text,
          'time': TimeOfDay.now().format(context),
          'isMe': true,
        });
        _messageController.clear();
      });
    }
  }

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String filePath = result.files.single.path!;
      setState(() {
        _messages.add({
          'file': filePath, // Store the file path
          'time': TimeOfDay.now().format(context),
          'isMe': true,
        });
      });
    }
  }

  void showAttachmentPopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    showGeneralDialog(
      context: context,
      barrierLabel: 'AttachmentPopup',
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                width: screenSize.width * 0.8,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AttachmentOption(
                        icon: Icons.insert_drive_file,
                        color: Colors.pink,
                        label: 'Document',
                        onPressed: () {
                          _selectFile();
                        }

                        /** () async {  FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc', 'docx']);
                      if (result != null) {
                        print('Document selected: ${result.files.single.name}');} },
                  **/

                        ),
                    AttachmentOption(
                      icon: Icons.camera_alt,
                      color: Colors.red,
                      label: 'Camera',
                      onPressed: () async {
                        // Access Camera
                        PermissionStatus permission =
                            await Permission.camera.request();
                        if (permission.isGranted) {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              _messages.add({
                                'image': pickedImage.path,
                                'time': TimeOfDay.now().format(context),
                                'isMe': true,
                              });
                            });

                            // print('Camera Image selected: ${pickedImage.path}');
                          }
                        } else {
                          print('Camera permission denied');
                        }
                      },
                    ),
                    AttachmentOption(
                      icon: Icons.photo,
                      color: Colors.blue,
                      label: 'Gallery',
                      onPressed: () async {
                        // Access Gallery
                        PermissionStatus permission =
                            await Permission.photos.request();
                        if (permission.isGranted) {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              _messages.add({
                                'image': pickedImage.path,
                                'time': TimeOfDay.now().format(context),
                                'isMe': true,
                              });
                            });

                            // print('Camera Image selected: ${pickedImage.path}');
                          }
                        } else {
                          print('Camera permission denied');
                        }
                      },
                    ),
                    AttachmentOption(
                      icon: Icons.audiotrack,
                      color: Colors.orange,
                      label: 'Audio',
                      onPressed: () async {
                        // Access Audio Files
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.audio);
                        if (result != null) {
                          print('Audio selected: ${result.files.single.name}');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(animation1),
          child: child,
        );
      },
    );
  }

  void showFlowers(BuildContext context) async {
    final selectedImage = await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return _ImageGridPopup();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset(0.0, 0.0);
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );

    if (selectedImage is String) {
      // Check if selectedImage is a String
      setState(() {
        _messages.add({
          'image': selectedImage,
          'time': TimeOfDay.now().format(context),
          'isMe': true,
        });
      });
    } else {
      // Handle the case where selectedImage is null or not a String
    }
  }

  void showOptionsPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Dialog will close when tapping outside
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 50, // Adjust the top position as per need
              right: 10, // Align the dialog to the top-right
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 150, // Set width as per your design
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildPopupOption('Edit'),
                      _buildPopupOption('Copy'),
                      _buildPopupOption('Reply'),
                      _buildPopupOption('Delete'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPopupOption(String option) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = option; // Updates the selected option
        });
      },
      child: Container(
        color: selectedOption == option
            ? Color.fromRGBO(54, 40, 221, 1.0)
            : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  color: selectedOption == option ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 86, 234, 0.09),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.profileImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.isOnline ? 'Online 2 hrs ago' : 'Offline',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.call, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(
                    name: 'Lil Mama',
                    profileImage: 'assets/images/profile_lil_mama.png',
                    callDuration: '10:00',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoCallScreen(
                    name: 'Lil Mama',
                    profileImage: 'assets/images/homeImage.png',
                    callDuration: '10:00',
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 30),
            onPressed: () {
              _showChatPopup(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final messageData = _messages[index];
                  if (messageData['message'] != null) {
                    return _buildMessageBubble(
                      message: messageData['message'],
                      time: messageData['time'],
                      isMe: messageData['isMe'],
                    );
                  } else if (messageData['image'] != null) {
                    return _buildImageBubble(
                      imagePath: messageData['image'],
                      time: messageData['time'],
                      isMe: messageData['isMe'],
                    );
                  } else if (messageData['file'] != null) {
                    return _buildFileBubble(
                      filePath: messageData['file'],
                      time: messageData['time'],
                      isMe: messageData['isMe'],
                    );
                  }

                  return Container(); // Return an empty container if no message or image
                }),
          ),
          _buildMessageInputField(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3628DD).withOpacity(0.19),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Ensure all items are shown
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/homeBlack.png',
                      width: 30, height: 30),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/locaIcon.png',
                      width: 30, height: 30),
                  label: 'People Nearby',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/blueChat.png',
                      width: 30, height: 30),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/matches.png',
                      width: 30, height: 30),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/icons/personIcon.png',
                      width: 30, height: 30),
                  label: 'Profile',
                ),
              ],
              selectedLabelStyle: TextStyle(
                  fontSize: 11), // Change the font size for the selected label
              unselectedLabelStyle: TextStyle(fontSize: 11),
              onTap: (index) {
                // Handle navigation based on the index
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DatingProfilePage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PeopleNearbyPage()),
                    );

                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Mainchat()),
                    );

                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Likes()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditLowProfileScreen()),
                    );
                    break;
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFileBubble({
    required String filePath,
    required String time,
    required bool isMe,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe
                    ? Color.fromRGBO(149, 140, 250, 1)
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.insert_drive_file,
                      color: isMe ? Colors.white : Colors.black87),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      filePath.split('/').last, // Display the file name
                      style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBubble({
    required String imagePath,
    required String time,
    required bool isMe,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              width: 150, // Set appropriate width for the image
              height: 150, // Set appropriate height for the image
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required String time,
    required bool isMe,
    bool isSeen = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bubbleWidth = screenWidth * 0.6;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onDoubleTap: () {
                showOptionsPopup(context);
              },
              child: Container(
                width: bubbleWidth, // Set the width to 60% of the screen width
                decoration: BoxDecoration(
                  color: isMe
                      ? Color.fromRGBO(149, 140, 250, 1)
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                if (isMe && isSeen)
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Seen',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInputField() {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Message',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: blue,
                    width: 2,
                  ),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.insert_emoticon, color: blue),
                  onPressed: () {},
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.local_florist_outlined,
                          color: Colors.pink),
                      onPressed: () {
                        showFlowers(context); // Call showFlowers function
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: blue),
                      onPressed: () {
                        showAttachmentPopup(context);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt_outlined, color: blue),
                      onPressed: () async {
                        // Access Camera
                        PermissionStatus permission =
                            await Permission.camera.request();
                        if (permission.isGranted) {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedImage != null) {
                            setState(() {
                              _messages.add({
                                'image': pickedImage.path,
                                'time': TimeOfDay.now().format(context),
                                'isMe': true,
                              });
                            });

                            // print('Camera Image selected: ${pickedImage.path}');
                          }
                        } else {
                          print('Camera permission denied');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send button
          IconButton(
            icon: const Icon(Icons.send, color: blue),
            onPressed: _sendMessage, // Call the send message function
          ),
          // Voice note button container
          GestureDetector(
            onTap: () {
              showVoiceNote(context);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Icon(
                  Icons
                      .mic, // Using just Icon instead of IconButton to center it properly
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showChatPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Dismiss when tapped outside
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black54, // Add a background overlay
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showFontPopup(context);
                      },
                      child: Text('Change Font Style',
                          style: TextStyle(fontSize: 14)),
                    ),
                    const Divider(thickness: 2),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReportPage()),
                        );
                      },
                      child: Text('Mute Notifications',
                          style: TextStyle(fontSize: 14)),
                    ),

                    const Divider(thickness: 2),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Avatar()),
                        );
                      },
                      child: Text('Search', style: TextStyle(fontSize: 14)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Avatar()),
                        );
                      },
                      child: Text('Report', style: TextStyle(fontSize: 14)),
                    ),
                    InkWell(
                      onTap: () {
                        showBlockPopup(context);
                      },
                      child: Text('Block', style: TextStyle(fontSize: 14)),
                    ),
                    // Add more items here to test scrolling
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0), // Slide in from the right
          end: Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}

void showFontPopup(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  String? selectedValue = 'Default';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.4,
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(54, 40, 221, 1),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Relationship',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      buildCustomRadioButton(context, 'Default', selectedValue,
                          (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                      buildCustomRadioButton(
                          context, 'Italianno', selectedValue, (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                      buildCustomRadioButton(context, 'Sanchez', selectedValue,
                          (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                      buildCustomRadioButton(context, 'Ranga', selectedValue,
                          (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                      buildCustomRadioButton(
                          context, 'Shadow into light', selectedValue,
                          (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                      buildCustomRadioButton(
                          context, 'Cherry Swash', selectedValue,
                          (String? value) {
                        if (value != null) {
                          selectedValue = value;
                          (context as Element).markNeedsBuild();
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Helper method to create a custom radio button
Widget buildCustomRadioButton(BuildContext context, String title,
    String? groupValue, Function(String?) onChanged) {
  return GestureDetector(
    onTap: () {
      onChanged(title); // Change the selected value when tapped
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Radio<String>(
          value: title,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: const Color.fromRGBO(54, 40, 221, 1),
        ),
      ],
    ),
  );
}

void showVoiceNote(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return VoiceNoteDialog();
    },
  );
}

class VoiceNoteDialog extends StatefulWidget {
  @override
  _VoiceNoteDialogState createState() => _VoiceNoteDialogState();
}

class _VoiceNoteDialogState extends State<VoiceNoteDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: 50,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Stop talking To Send',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(54, 40, 221, 0.19),
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 70,
                height: 75,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(54, 40, 221, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: 55,
                    height: 55,
                    child: Icon(
                      Icons.mic_none_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Try Saying Something',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            SizedBox(height: 5),
            Text('Listening.........',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

// Widget for attachment options
class AttachmentOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onPressed;

  AttachmentOption({
    required this.icon,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 20,
              child: Icon(icon, color: Colors.white, size: 20),
            ),
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}

class _ImageGridPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'assets/images/flower1.png',
      'assets/images/flower2.png',
      'assets/images/flower3.png',
      'assets/images/flower4.png',
      'assets/images/flower5.png',
      'assets/images/flower6.png',
      'assets/images/flower7.png',
      'assets/images/flower8.png',
      'assets/images/flower9.png',
    ];

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap:
              () {}, // Prevents the tap inside the container from closing the popup
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Stickers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                        itemCount: imageUrls.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns
                          crossAxisSpacing: 14.0,
                          mainAxisSpacing: 14.0,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context,
                                  imageUrls[
                                      index]); // Ensure this returns a String
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
