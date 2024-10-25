import 'package:flutter/material.dart';
import 'package:love_bird/homeScreen/notification.dart';
import 'package:love_bird/homeScreen/preference.dart'; // Import the FilterOptions class

class DatingProfilePage extends StatelessWidget {
  const DatingProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    FilterOptions filterOptions =
        FilterOptions(); // Create instance of FilterOptions

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black, size: 40),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    showLibbyPopup(
                        context); // Call the separate function to show the popup
                  },
                  child: Image.asset('assets/images/robot.png', width: 40),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Love Bird',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showExtraViewsPopup(context); // Show extra views popup
                  },
                  child: Image.asset('assets/images/message.png', width: 30),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Colors.black, size: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsPage()),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    filterOptions.showFilterOptions(context,
                        (int startAge, int endAge) {
                      // This callback is triggered when the age range is selected.
                      print('Selected Age Range: $startAge - $endAge');
                    }); // Show filter options
                  },
                  child: Image.asset('assets/images/Vector.png', width: 30),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    // Replace this part with the ProfileInfo widget
                    ProfileInfo(
                      imageUrl: 'assets/images/homeImage.png',
                      name: 'Daniel, 31',
                      location: '26km away',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 22),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 12, 12),
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon:
                        Image.asset('assets/images/icons/home.png', width: 10),
                    onPressed: () {
                      // Handle navigation
                    },
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset('assets/images/icons/localcon.png',
                        width: 10),
                    onPressed: () {
                      // Handle navigation
                    },
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset('assets/images/icons/chatIcon.png',
                        width: 10),
                    onPressed: () {
                      // Handle navigation
                    },
                  ),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset('assets/images/icons/matches.png',
                        width: 10),
                    onPressed: () {
                      // Handle navigation
                    },
                  ),
                  label: 'Matches',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset('assets/images/icons/personIcon.png',
                        width: 10),
                    onPressed: () {
                      // Handle navigation
                    },
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                // Handle navigation taps
              },
            ),
          ),
        ),
      ),
    );
  }

  void showExtraViewsPopup(BuildContext context) {
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/credit.png',
                    width: 70, height: 50),
              ),
              const SizedBox(height: 2),
              const Text(
                'Extra Views',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Be seen by more people and get up to 6x more likes.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PurchaseCreditsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Get Extra Views For 150 Credits',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: OutlinedButton(
                  onPressed: () {
                    // Handle navigation to Premium Plan
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: const BorderSide(color: blue, width: 2),
                  ),
                  child: const Text(
                    'Get Love Bird Premium Plan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Maybe Later',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLibbyChatbot(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Dismiss when tapping outside
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Background of the popup (semi-transparent)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                      context); // Dismiss popup when background is tapped
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            // The chatbot centered dialog
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Minimize to content size
                    children: [
                      // Header section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        color: const Color(0xFF3628DD), // Blue header color
                        child: const Text(
                          'Hello there 👋',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Chatbot body text
                      const Text(
                        'I am Libby!\n\nWelcome to Love Bird AI Virtual Assistance.\n\nYou can ask me anything on dating, relationship advice, event & activity suggestions, conversation advice, real life tips, etc.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // "Ask me anything" button
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
}

class ProfileInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;

  const ProfileInfo({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semi-transparent container behind the name and location
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // Semi-transparent container for interaction buttons
          Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/left.png'),
                  const Spacer(),
                  Image.asset('assets/images/love2.png'),
                  const Spacer(),
                  Image.asset('assets/images/star2.png'),
                  const Spacer(),
                  Image.asset('assets/images/cancel.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*IconButton(
                  icon: Image.asset('assets/images/vector.png', width: 10),
                  onPressed: () {
                    // Function to show Extra Views popup
                  },
                ),*/