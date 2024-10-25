import 'package:flutter/material.dart';
import 'package:love_bird/chat/chatScreen.dart';
import 'package:love_bird/chat/liveChat.dart';
import 'package:love_bird/edit%20profile%20screens/edit_low_profile_screen.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/likes.dart';
import 'package:love_bird/matches/peopleNearby.dart';

class Mainchat extends StatefulWidget {
  const Mainchat({super.key});

  @override
  State<Mainchat> createState() => _MainchatState();
}

class _MainchatState extends State<Mainchat> {
  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add action here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 30),
            onPressed: () {
              // Add action here
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Likes And Matches',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      profileAvatarMain(
                        "Your story",
                        "assets/images/homeImage.png",
                      ),
                      profileAvatar("Lil Mama", "assets/images/homeImage.png",
                          false, true),
                      profileAvatar("John Cena", "assets/images/homeImage.png",
                          false, false),
                      profileAvatar("Katy Butch", "assets/images/homeImage.png",
                          true, true),
                    ],
                  ),
                ),
                Divider(),
                loveChatItem("Love Bird", "You have 3 new messages!", true),
                Expanded(
                  child: ListView(
                    children: [
                      chatItem(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailScreen(
                              name: 'Lil Mama',
                              profileImage: 'assets/images/homeImage.png',
                              isOnline: true,
                            ),
                          ),
                        );
                      }, "Lil Mama", "Are you available for a call?",
                          "assets/images/homeImage.png", true),
                      chatItem(
                          "Katy Butch",
                          "Just saw your profile, let’s chat.",
                          "assets/images/homeImage.png",
                          false),
                      chatItem("Malory Ritz", "I'll call you later tonight",
                          "assets/images/homeImage.png", false),
                      chatItem("Daniel", "Hey! How’s it going?",
                          "assets/images/homeImage.png", true),
                      chatItem("Jenny Bill", "Let’s meet up tomorrow.",
                          "assets/images/homeImage.png", false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned robot icon at the bottom
          Positioned(
              bottom: 20,
              right: 40,
              child: InkWell(
                  onTap: () {
                    showLibbyChatbot(context);
                  },
                  child: Image.asset('assets/images/robot.png'))),
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

// Widget for the profile avatars on top
  Widget profileAvatar(
      String name, String imagePath, bool isOnline, bool story) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Stack(
            children: [
              if (story)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    padding: EdgeInsets.all(4), // Adjusted padding for spacing
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // White space between the border and image
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(imagePath),
                    ),
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding: EdgeInsets.all(1.5),
                  child: Container(
                    padding: EdgeInsets.all(4), // Adjusted padding for spacing
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // White space between the border and image
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(imagePath),
                    ),
                  ),
                ),
              if (isOnline)
                Positioned(
                  right: 9,
                  bottom: 2,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Widget for each chat item
  Widget chatItem(
    String name,
    String message,
    String imagePath,
    bool isOnline, {
    bool isLive = false,
    VoidCallback? onTap, // Add onTap parameter
  }) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imagePath),
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLive) Icon(Icons.live_tv, color: Colors.red, size: 16),
          Text(
            '4h ago',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
      onTap: onTap, // Set the onTap callback
    );
  }

//widget for the main user to add a story
  Widget profileAvatarMain(
    String name,
    String imagePath,
  ) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage(imagePath),
              ),
              Positioned(
                right: 6,
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle, // Ensures the container is a circle
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15, // Icon size proportional to the container size
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget loveChatItem(
    String name,
    String message,
    bool chat,
  ) {
    return ListTile(
      leading: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Image.asset('assets/images/icons/lovechat.png'),
          ),
          if (chat) // Red container when chat is true
            Positioned(
              top: 0,
              right: 0.0, // Matches the padding of the image
              child: Container(
                width: 10, // Adjust size as needed
                height: 10,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(chat ? 'No new messages' : message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LiveChatScreen()),
              );
            },
            child: Image.asset('assets/images/icons/live.png'),
          ),
          Text('Live', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

/**  Container(
                    height: 100,
                    width: screenSize.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(97, 86, 234, 0.19)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/homeImage.png'),
                            ),
                            Column(
                              children: [
                                Text('daniel'),
                                Text(
                                    'You have matched! Now Start a conversation with Derick'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: screenSize.width * 0.3,
                              height: screenSize.height * 0.05,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(54, 40, 221, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'text',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: screenSize.width * 0.4,
                              height: screenSize.height * 0.06,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(54, 40, 221, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'text',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ])
                      ],
                    )),**/