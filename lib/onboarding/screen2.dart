import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with curve
          ClipPath(
            clipper: CurvedPainter(),
            child: Container(
              color: const Color.fromRGBO(54, 40, 221, 1),
              height: 400,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GridView for matches
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return const MatchCard(); // Custom widget for match card
                  },
                  itemCount: 4, // Replace with the actual count of profiles
                ),
              ),
              const SizedBox(height: 20),
              // Text Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Discover Meaningful Connections',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Join Love Bird today and explore a world of meaningful connections. Swipe, match, and meet like-minded people.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              // Skip Button
              TextButton(
                onPressed: () {
                  // Add skip functionality here
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Skip'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Path for the Curved Background
class CurvedPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Example MatchCard Widget
class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Profile Image
          Expanded(
            child: Image.network('https://via.placeholder.com/150',
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          const Text('Name, Age'),
        ],
      ),
    );
  }
}
