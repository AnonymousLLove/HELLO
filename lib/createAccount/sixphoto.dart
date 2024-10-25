import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_bird/createAccount/photoVer.dart';

class UploadPicturesScreen extends StatefulWidget {
  const UploadPicturesScreen({super.key});

  @override
  _UploadPicturesScreenState createState() => _UploadPicturesScreenState();
}

class _UploadPicturesScreenState extends State<UploadPicturesScreen> {
  List<File?> images = List.filled(9, null); // Stores up to 9 images
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: 9, // Total images or slots
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showImageSourceActionSheet(index),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: images[index] == null
                ? const Icon(Icons.add, size: 20)
                : Image.file(
                    images[index]!,
                    fit: BoxFit.fill,
                  ),
          ),
        );
      },
    );
  }

  void _showImageSourceActionSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Count how many images have been uploaded
    int uploadedImageCount = images.where((image) => image != null).length;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0.7, // Simulating progress
                  backgroundColor: Color.fromARGB(255, 247, 243, 243),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(children: [
              const Text('Show Your Best Self',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Image.asset('assets/images/six.png', width: 40)
            ]),
            const Text(
              'Upload at least 6 of your best pictures to make a great first impression.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _buildImageGrid(),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: uploadedImageCount >= 1
                      ? const Color.fromRGBO(54, 40, 221, 1)
                      : Colors
                          .grey, // Button is disabled (gray) until 6 images are uploaded
                  foregroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize:
                      const Size(double.infinity, 50), // full-width button
                ),
                onPressed: uploadedImageCount >= 1
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Photoscreen1()),
                        );
                      }
                    : null, // Button disabled until at least 6 images are uploaded
                child: Text(
                  "Continue ($uploadedImageCount/9)", // Show current progress
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photoscreen1 extends StatefulWidget {
  const Photoscreen1({super.key});

  @override
  _Photoscreen1State createState() => _Photoscreen1State();
}

class _Photoscreen1State extends State<Photoscreen1> {
  bool isTapped = true; // State variable to track if tapped

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        // Allow scrolling if necessary
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.8, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                // Allow the text to take available space
                Text(
                  'Photo Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5), // Add spacing between text and image
                Image.asset('assets/images/verify.png',
                    height: 40), // Set image height
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: Image.asset(
                'assets/images/photover.png',
                width: screenSize.width *
                    0.8, // Use a percentage of the screen width
                height: screenSize.width * 0.8, // Maintain aspect ratio
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Prove you’re the real you, with selfies. If the pics matches your profile, we’ll give you a blue tick to show off your new verified status. And we’ll keep the selfies just between us.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            const SizedBox(height: 30), // Add some space before the buttons
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GestureVerificationScreen()),
                      );
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height *
                          0.07, // Increase height for better tap area
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Continue',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped; // Toggle tapped state
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height *
                          0.07, // Increase height for better tap area
                      decoration: BoxDecoration(
                        color: isTapped
                            ? Colors.grey[300]
                            : const Color.fromRGBO(
                                54, 40, 221, 1), // Change color based on state
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Maybe Later',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureVerificationScreen extends StatelessWidget {
  const GestureVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar at the top
              SizedBox(
                height: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: 0.7, // Simulating progress
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(54, 40, 221, 1),
                    ),
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Copy these gestures to verify your photo.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              // Gesture verification images
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      232, 232, 255, 1), // Background color for the image area
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    // Front-facing image
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/images/front.png' // Replace with your image URL
                                ),
                          ),
                          SizedBox(height: 8),
                          Text("Front",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Side-facing images (Left & Right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/left2.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Left",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/right.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Right",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              // Verify button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Handle verification action here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhotoScreen3()),
                  );
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Photoscreen2 extends StatefulWidget {
  const Photoscreen2({super.key});

  @override
  _Photoscreen1State createState() => _Photoscreen1State();
}

class _Photoscreen2State extends State<Photoscreen1> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.8, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Row with Photo Verification Text and small verify icon
            Row(
              children: [
                const Text(
                  'Photo Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/images/verify.png',
                  width: 30,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Column to center the image and description
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the items
              children: [
                // Center the photo verification image
                Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/images/photover.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space between the image and text

                // Description text
                const Text(
                  'Prove you’re the ruueal you, with selfies. If the pics matches your profile, we’ll give you a blue tick to show off your new verified status. And we’ll keep the selfies just between us.',
                  textAlign: TextAlign.center, // Center-align text
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),

            const Spacer(),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GestureVerificationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Continue',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PhotoScreen3 extends StatelessWidget {
  const PhotoScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        // Allow scrolling if necessary
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.8, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Row with Photo Verification Text and small verify icon
            const Text(
              'Please wait',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Your photo verification process will begin in a few seconds. Click next to proceed.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Center(
              child: Stack(
                alignment: Alignment.center, // Center the second image
                children: [
                  // First image (background image)
                  Image.asset(
                    'assets/images/verimage.png',
                    width: screenSize.width *
                        0.8, // Use a percentage of the screen width
                    height: screenSize.width * 1.2, // Maintain aspect ratio
                    fit: BoxFit
                        .cover, // Scale the image to fit within the container
                  ),
                  // Second image (overlay image)
                  Image.asset(
                    'assets/images/photo1.png',
                    width: screenSize.width *
                        0.5, // Use a percentage of the screen width
                    height: screenSize.width * 0.5, // Maintain aspect ratio
                    fit: BoxFit
                        .contain, // Keep the image's original aspect ratio
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Add space before the button
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhotoVerification(),
                    ),
                  );
                },
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Continue',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
