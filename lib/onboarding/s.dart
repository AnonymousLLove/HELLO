import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Stack(
                alignment: Alignment.bottomCenter, // Align items to the bottom
                children: [
                  // Main white container with blue border
                  Container(
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white, // White background for the container
                      border: Border.all(
                        color:
                            const Color.fromRGBO(54, 40, 221, 1), // Blue border
                        width: 10, // Border width
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                height: 10,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  border: Border.all(width: 10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5, bottom: 0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/image2.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 50),
                                  const Center(
                                    child: Text(
                                      'Matches',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    icon: const Icon(Icons.search, size: 20),
                                    onPressed: () {
                                      print("Search icon tapped");
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    'assets/images/Vector.png',
                                    width: 10,
                                    height: 10,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(54, 40, 221, 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 120,
                                    height: 30,
                                    child: const Center(
                                      child: Text(
                                        'Likes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 123, 139),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 120,
                                    height: 30,
                                    child: const Center(
                                      child: Text(
                                        'Super Like',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // Wrap GridView in Expanded to avoid overflow issues
                              child: GridView.builder(
                                padding: const EdgeInsets.all(16),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return const MatchCard();
                                },
                                itemCount: 4,
                              ),
                            ),
                          ],
                        )),
                  ),
                  // Image aligned from the middle to the bottom
                  Positioned(
                    top: 250,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      // Adjusted height
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/Rectangle.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text on top of the image
                  const Positioned(
                    bottom: 100,
                    child: Text(
                      'Discover Meaningful Connections',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/o1.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          const Text('Name, Age'),
        ],
      ),
    );
  }
}
