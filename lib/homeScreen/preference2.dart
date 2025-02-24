import 'package:flutter/material.dart';
import 'package:love_bird/homeScreen/homeScreen2.dart';

String selectedMinHeight = "No minimum"; // Default value
String selectedMaxHeight = "No maximum"; //

class MoreOptions extends StatefulWidget {
  const MoreOptions({super.key});

  @override
  State<MoreOptions> createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  void showSexualityPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showHeightPreferenceDialog(
                              context,
                              (minHeight, maxHeight) {
                                setState(() {
                                  selectedMinHeight = minHeight;
                                  selectedMaxHeight = maxHeight;
                                });
                              },
                            );
                          },
                          icon: Icon(Icons.chevron_left),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        const Text(
                          'Sexuality',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: screenSize.width * 0.15),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Which sexual orientation(s) are you looking for?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Checkbox list with single selection logic
                    CheckboxListTile(
                      title: const Text('Straight',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      value: selectedCheckboxIndex == 0,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 0 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 2,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text('Open minded',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      value: selectedCheckboxIndex == 1,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 1 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 2,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text('Bisexual',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      value: selectedCheckboxIndex == 2,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 2 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 2,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text('Gay/Lesbian',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      value: selectedCheckboxIndex == 3,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 3 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 2,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isContainerTapped =
                                !isContainerTapped; // Toggle container state
                          });
                          // Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color:
                                isContainerTapped // Change color based on state
                                    ? const Color(
                                        0xFF3628DD) // Container color when tapped
                                    : Color.fromRGBO(
                                        149, 140, 250, 1), // Default color
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFF3628DD),
                            ),
                          ),
                          child: Center(
                            child: const Text(
                              'See other people if I run out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: screenSize.width * 0.45,
                          height: screenSize.height * 0.05,
                          decoration: BoxDecoration(
                            color: Color(0xFF3628DD),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Apply',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // Default values

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 30),
          onPressed: () {
            Navigator.pop(context); // Go back when pressed
          },
        ),
        // Add your title or leave blank
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: const Icon(Icons.close, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 5, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'More options',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: const Text(
                textAlign: TextAlign.center,
                'Use the filters to focus your search on the people you really want to meet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: const Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildFilterTile(
                    'Photo verified',
                    'Are their photos real?',
                    () => showPhoto(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Height',
                    'Want someone you can look up to?',
                    () => showHeightPreferenceDialog(
                      context,
                      (minHeight, maxHeight) {
                        // Handle the selected height values here
                        print(
                            "Selected Height Range: $minHeight to $maxHeight");

                        // You can set the selected values to a state or variable, for example:
                        setState(() {
                          selectedMinHeight = minHeight;
                          selectedMaxHeight = maxHeight;
                        });
                      },
                    ),
                  ),
                  _buildFilterTile(
                    'Sexuality',
                    'What’s their sexual orientation?',
                    () => showSexualityPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Here for',
                    'Do they want to date or find a relationship?',
                    () => showHerePreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Star sign',
                    'What’s written in their stars?',
                    () => showStarPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Language',
                    'Will you understand each other?',
                    () => showLanguagePreferencePopup(
                      context,
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: const Text(
                      'LifeStyle',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildFilterTile(
                    'Children',
                    'Have them? Want them? Not sure?',
                    () => showChildrenPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Pets',
                    'Kitty litters or morning walkies?',
                    () => showPetsPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Smoking',
                    'Do you mind if they light up?',
                    () => showSmokingPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Drinking',
                    'Will you raise a glass together?',
                    () => showDrinkingPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Education',
                    'Diploma, or school of life?',
                    () => showEducationPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Religion',
                    'What do they believe in?',
                    () => showReligionPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Relationship',
                    'Are they single and ready to mingle?',
                    () => showRelationshipPreferencePopup(
                      context,
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: const Text(
                      'Personality',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildFilterTile(
                    'Personality',
                    'What’s their social style?',
                    () => showPersonalityPreferencePopup(
                      context,
                    ),
                  ),
                  _buildFilterTile(
                    'Interest',
                    'What have you got in common?',
                    () => showInterestSearchPopup(
                      context,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DatingProfilePage()),
                  );
                },
                child: Container(
                  width: screenSize.width * 0.6,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Apply',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTile(String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 13)),
      trailing: GestureDetector(
        onTap: onTap, // Call the provided onTap function
        child: const Icon(Icons.chevron_right),
      ),
      onTap: () {
        // Optionally handle filter tap here if needed
      },
    );
  }

  void showPhoto(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            width: screenSize.width * 0.85, // Set the width as a percentage
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Wraps content size
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: (Icon(Icons.chevron_left))),
                    SizedBox(width: screenSize.width * 0.10),
                    const Text(
                      'Photo verified',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: screenSize.width * 0.10),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: (Icon(Icons.close))),
                  ],
                ),
                const Text(
                  'Are their photos for real?',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: screenSize.width * 0.65,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(149, 140, 250, 1),
                          )),
                      child: Center(
                        child: Text(
                          'Photo Verified',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

                //  const SizedBox(height: 10),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isContainerTapped =
                              !isContainerTapped; // Toggle container state
                        });
                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: screenSize.width * 0.65,
                        height: screenSize.height * 0.05,
                        decoration: BoxDecoration(
                          color:
                              isContainerTapped // Change color based on state
                                  ? const Color(
                                      0xFF3628DD) // Container color when tapped
                                  : Color.fromRGBO(
                                      149, 140, 250, 1), // Default color
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                        child: Center(
                          child: const Text(
                            'See other people if I run out',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Option 2 Button

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenSize.width * 0.45,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                // Apply Button
              ],
            ),
          ),
        );
      },
    );
  }

  void showHeightPreferenceDialog(
      BuildContext context, Function(String, String) onHeightRangeSelected) {
    bool isContainerTapped = false;
    List<String> heightValues = [
      "No minimum",
      "150cm (5'0\")",
      "160cm (5'3\")",
      "170cm (5'7\")",
      "180cm (5'11\")",
      "190cm (6'3\")",
      "219cm (7'3\")",
      "No maximum"
    ];

    String _selectedMinHeight = "No minimum"; // Default values
    String _selectedMaxHeight = "No maximum";
    final screenSize = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: screenSize.width * 0.9, // Adjust width as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showPhoto(
                            context,
                          );
                        },
                        icon: (Icon(Icons.chevron_left))),
                    SizedBox(width: screenSize.width * 0.15),
                    const Text(
                      'Height',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: screenSize.width * 0.15),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: (Icon(Icons.close))),
                  ],
                ),

                const Text(
                  'How tall should they be?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150, // Limit the height
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 60, // Height of each item
                              onSelectedItemChanged: (index) {
                                _selectedMinHeight = heightValues[index];
                                _selectedMaxHeight = heightValues[index];
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return Column(
                                    children: [
                                      Text(
                                        heightValues[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: heightValues[index] ==
                                                  _selectedMinHeight
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      if (index != heightValues.length - 1)
                                        const Divider(), // Add a divider
                                    ],
                                  );
                                },
                                childCount: heightValues.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150, // Limit the height
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 60, // Height of each item
                              onSelectedItemChanged: (index) {
                                _selectedMaxHeight = heightValues[index];
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (context, index) {
                                  return Column(
                                    children: [
                                      Text(
                                        heightValues[index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: heightValues[index] ==
                                                  _selectedMaxHeight
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                      if (index != heightValues.length - 1)
                                        const Divider(), // Add a divider
                                    ],
                                  );
                                },
                                childCount: heightValues.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isContainerTapped =
                            !isContainerTapped; // Toggle container state
                      });
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: screenSize.width * 0.65,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: isContainerTapped // Change color based on state
                            ? const Color(
                                0xFF3628DD) // Container color when tapped
                            : Color.fromRGBO(149, 140, 250, 1), // Default color
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF3628DD),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          'See other people if I run out',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                // Option 2 Button

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      onHeightRangeSelected(
                          _selectedMinHeight, _selectedMaxHeight);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenSize.width * 0.45,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
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

  void showHerePreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: screenSize.width * 0.9, // Adjust width as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Wrap content size
              children: [
                // Header with back and close buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showSexualityPreferencePopup(context);
                      },
                      icon: Icon(Icons.chevron_left),
                    ),
                    SizedBox(width: screenSize.width * 0.15),
                    const Text(
                      'Here For',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: screenSize.width * 0.15),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Choose as many options as you want. We’ll show you people who are here for this.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Relationship Preference Options
                Column(
                  children: [
                    CheckboxListTile(
                      title: const Text(
                        'Open to chat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      value: selectedCheckboxIndex == 0,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 0 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Here to Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      value: selectedCheckboxIndex == 1,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 1 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Casual',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      value: selectedCheckboxIndex == 2,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 2 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Ready for a Relationship',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      value: selectedCheckboxIndex == 3,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedCheckboxIndex = value! ? 3 : -1;
                        });
                      },
                      activeColor: const Color.fromRGBO(54, 40, 221, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(54, 40, 221, 1),
                        width: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // "See other people" button
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isContainerTapped =
                            !isContainerTapped; // Toggle container state
                      });
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: screenSize.width * 0.65,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: isContainerTapped // Change color based on state
                            ? const Color(
                                0xFF3628DD) // Container color when tapped
                            : Color.fromRGBO(149, 140, 250, 1), // Default color
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF3628DD),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          'See other people if I run out',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                // Apply Button
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenSize.width * 0.45,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3628DD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
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

  void showStarPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Define a variable to keep track of the selected star sign
    String? selectedStarSign;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showRelationshipPreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Star Sign',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for a particular star sign?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // List of Star Sign options with exclusive selection
                      Column(
                        children: [
                          'Aries',
                          'Taurus',
                          'Gemini',
                          'Cancer',
                          'Leo',
                          'Virgo',
                          'Libra',
                          'Scorpio',
                          'Sagittarius',
                          'Capricorn',
                          'Aquarius',
                          'Pisces'
                        ].map((starSign) {
                          return CheckboxListTile(
                            title: Text(starSign,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            value: selectedStarSign == starSign,
                            onChanged: (bool? value) {
                              setState(() {
                                // Update the selected star sign
                                selectedStarSign = value! ? starSign : null;
                              });
                            },
                            activeColor: const Color.fromRGBO(54, 40, 221, 1),
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                              color: Color.fromRGBO(54, 40, 221, 1),
                              width: 2,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            // Apply selected preference action here
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showLanguagePreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: screenSize.width * 0.85, // Adjust width as needed
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Wrap content size
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showSexualityPreferencePopup(
                              context,
                            );
                          },
                          icon: (Icon(Icons.chevron_left))),
                      SizedBox(width: screenSize.width * 0.15),
                      const Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: screenSize.width * 0.15),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: (Icon(Icons.close))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    textAlign: TextAlign.center,
                    "What language(s) Should they speak",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  // Sexual Orientation Options
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: const Text('English',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221, 1),
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            width: 2,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Spanish',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221, 1),
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            width: 2,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Mandarin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221, 1),
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            width: 2,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Hindi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221, 1),
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            width: 1,
                          ),
                        ),
                        // Add more languages below:
                        CheckboxListTile(
                          title: const Text('Arabic',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221, 1),
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221, 1),
                            width: 1,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Aries',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),

                        CheckboxListTile(
                          title: const Text('Taurus',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 2, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Gemini',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 2, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Cancer',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Cancer',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Virgo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 2, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Leo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Scrpoi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('saggitarus',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Capricon',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Aquarius',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text('Pisces',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          value: false, // Your checkbox value here
                          onChanged: (bool? value) {
                            // Handle state change
                          },
                          activeColor: const Color.fromRGBO(54, 40, 221,
                              1), // The color of the checkbox when checked
                          checkColor: Colors
                              .white, // The color of the check inside the box when checked
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the checkbox
                          ),
                          side: const BorderSide(
                            color: Color.fromRGBO(54, 40, 221,
                                1), // Border color for the checkbox
                            width: 1, // Border width
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isContainerTapped =
                              !isContainerTapped; // Toggle container state
                        });
                        // Navigator.pop(context);
                      },
                      child: Container(
                        width: screenSize.width * 0.65,
                        height: screenSize.height * 0.05,
                        decoration: BoxDecoration(
                          color:
                              isContainerTapped // Change color based on state
                                  ? const Color(
                                      0xFF3628DD) // Container color when tapped
                                  : Color.fromRGBO(
                                      149, 140, 250, 1), // Default color
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                        child: Center(
                          child: const Text(
                            'See other people if I run out',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Option 2 Button

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: screenSize.width * 0.45,
                        height: screenSize.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3628DD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Optional Button for "See other people if I run out"
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showChildrenPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Children',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for someone who has or wants children?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Would like them someday',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Already has children',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Doesn’t want them',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showPetsPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Pets',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you looking for someone who has pets?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Cat(s)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Dog(s)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Doesn’t want Multiple',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      CheckboxListTile(
                        title: const Text(
                          'Other',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      CheckboxListTile(
                        title: const Text(
                          'None',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 4 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(149, 140, 250, 1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showSmokingPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Smoking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What Should their smoking habit be?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Smoking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Non- Smoking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showDrinkingPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isContainerTapped = false;
    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Drinking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Should They Drink?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Socially',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Never',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Other',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "No, they're Sober",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showEducationPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Education',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are You Looking For Someone with a specfic Education Level?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'High School',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'In College',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Finished College',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "In grad School",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "Finished Graduate degree or higher",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 4,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 4 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showReligionPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Religion',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are You Looking for a particular religion?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Atheist',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Christian',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Muslim',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "Other",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showRelationshipPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Relationship',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "What Relationship status(es) are you looking for?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Single',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Taken',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Muslim',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          "Other",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 3,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 3 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showPersonalityPreferencePopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Variable to track which checkbox is selected
    int selectedCheckboxIndex = -1;
    bool isContainerTapped = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                width: screenSize.width * 0.85, // Adjust width as needed
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // Wrap content size
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showLanguagePreferencePopup(context);
                            },
                            icon: Icon(Icons.chevron_left),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          const Text(
                            'Personality',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.15),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Introvert(more quiet and reserved) or extrovert(more social and outgoing)",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Checkbox ListTiles with rounded borders and single-selection logic
                      CheckboxListTile(
                        title: const Text(
                          'Extrovert',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 0,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 0 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Introvert',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 1,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 1 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text(
                          'Somewhere in between',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: selectedCheckboxIndex == 2,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedCheckboxIndex = value! ? 2 : -1;
                          });
                        },
                        activeColor: const Color.fromRGBO(54, 40, 221, 1),
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color.fromRGBO(54, 40, 221, 1),
                          width: 1,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isContainerTapped =
                                  !isContainerTapped; // Toggle container state
                            });
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.65,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color:
                                  isContainerTapped // Change color based on state
                                      ? const Color(
                                          0xFF3628DD) // Container color when tapped
                                      : Color.fromRGBO(
                                          149, 140, 250, 1), // Default color
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF3628DD),
                              ),
                            ),
                            child: Center(
                              child: const Text(
                                'See other people if I run out',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: screenSize.width * 0.45,
                            height: screenSize.height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3628DD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showInterestSearchPopup(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    List<String> popularInterests = [
      "#listeningtomusic",
      "#laughing",
      "#chilling",
      "#honesty",
      "#pizza",
      "#dinnerwithfriends"
    ];
    List<String> displayedInterests = List.from(popularInterests);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showSexualityPreferencePopup(
                              context,
                            );
                          },
                          icon: (Icon(Icons.chevron_left))),
                      SizedBox(width: screenSize.width * 0.15),
                      const Text(
                        'Interest',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: screenSize.width * 0.15),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: (Icon(Icons.close))),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        // Perform search filtering
                        setState(() {
                          displayedInterests = popularInterests
                              .where((interest) => interest
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search by interest",
                        hintStyle: const TextStyle(
                          color: Color(0xFF9B9B9B),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: const Color(0xFF3628DD),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // List of popular interests
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: displayedInterests.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            displayedInterests[index],
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[800]),
                          ),
                          onTap: () {
                            // Handle interest selection
                            print("Selected: ${displayedInterests[index]}");
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
