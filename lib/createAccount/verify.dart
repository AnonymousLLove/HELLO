import 'package:flutter/material.dart';

import 'package:love_bird/createAccount/nickname.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Message icon image in the center
                Container(
                  width: 130, // Adjust the size as needed
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: blue, // Blue border color
                      width: 4,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/icons/messageI.png', // Your message icon image
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Email sent information
                const Text(
                  'We have sent an email to yourmail@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                const Text(
                  'Click the link in your email to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Resend email option
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive email?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // Handle resend email
                        },
                        child: const Text(
                          'Resend email',
                          style: TextStyle(
                            fontSize: 15,
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned button at the bottom of the screen
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              width: screenSize.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: blue, // Blue border
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaptchaVerificationPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'I have verified my email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CaptchaVerificationPage extends StatelessWidget {
  const CaptchaVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              //  width: 400,
              height: 25, // Set this to whatever width you want
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // Set the corner radius here
                child: LinearProgressIndicator(
                  value: 0.1, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8, // Set the height of the progress bar
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Verify you're human",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(width: 5),
                Image.asset('assets/images/two.png')
              ],
            ),

            // Instruction text
            const Text(
              "Please solve this captcha so we know you are a person",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            const Text(
              textAlign: TextAlign.start,
              "Please tick the box to continue",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Captcha placeholder box
            Container(
              width: screenSize.width * 0.9,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: blue, // Blue border color
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  // Checkbox and "I'm not a robot" text
                  Row(
                    children: [
                      // Checkbox with blue borders
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: blue, // Blue border
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check, // Placeholder for check mark
                          color: blue,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),

                      // "I'm not a robot" text
                      const Text(
                        "I'm not a robot",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),

                      // Placeholder for Google Captcha icon (use your captcha widget in actual implementation)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoveBirdIdentityScreen()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/logos_recaptcha.png', // Add your captcha image or widget
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(), // Pushes content to the top to allow more space at the bottom
          ],
        ),
      ),
    );
  }
}
