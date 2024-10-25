import 'package:flutter/material.dart';
import 'package:love_bird/chat/mainChat.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';
import 'package:love_bird/matches/likes.dart';

class PeopleNearbyyPage extends StatelessWidget {
  const PeopleNearbyyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('People NearBy'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Nearby'),
              Tab(text: 'Profile Visitors'),
              Tab(text: 'Likes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PeopleNearbyyGrid(), // Your existing grid for nearby people
            ProfileVisitorsPage(), // New page for Profile Visitors
            LikesPage(), // New page for Likes
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey[200],
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon:
                        Image.asset('assets/images/icons/home.png', width: 30),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/locaIcon.png',
                        width: 30),
                    label: 'People Nearby',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/chatIcon.png',
                        width: 30),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/matches.png',
                        width: 30),
                    label: 'Matches',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icons/personIcon.png',
                        width: 30),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  // Handle navigation based on the index
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatingProfilePage()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PeopleNearbyyPage()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mainchat()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Likes()),
                      );
                      break;
                    case 4:
                      // Add navigation for Profile
                      break;
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// People Nearby Grid
class PeopleNearbyyGrid extends StatelessWidget {
  final List<User> users = [
    User(imageUrl: 'assets/images/homeImage.png', name: 'David', age: 31),
    User(imageUrl: 'assets/images/homeImage.png', name: 'James', age: 29),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Tom', age: 32),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
    User(imageUrl: 'assets/images/homeImage.png', name: 'Michael', age: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 14.0,
        childAspectRatio: 0.7,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserCard(user: users[index]);
      },
    );
  }
}

// Profile Visitors Page
class ProfileVisitorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual content for Profile Visitors
    return Center(
      child: Text('Profile Visitors Page'),
    );
  }
}

// Likes Page
class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual content for Likes
    return Center(
      child: Text('Likes Page'),
    );
  }
}

// User Model
class User {
  final String imageUrl;
  final String name;
  final int age;

  User({required this.imageUrl, required this.name, required this.age});
}

// User Card
class UserCard extends StatelessWidget {
  final User user;

  const UserCard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(user.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semi-transparent container behind the name and location
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${user.age}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
