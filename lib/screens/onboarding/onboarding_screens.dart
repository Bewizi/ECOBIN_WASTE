import 'package:ecobin/screens/register/register.dart';
import 'package:flutter/material.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  // Controller for the PageView to manage pages
  final PageController _pageController = PageController(initialPage: 0);

  // State variable to keep track of the current page index
  int _currentPage = 0;

  // Total number of onboarding pages (0-indexed, so 3 pages means last index is 2)
  final int _totalPages = 2; // Page 0, Page 1, Page 2

  @override
  void initState() {
    super.initState();
    // Add a listener to the PageController to update _currentPage when the page changes
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView to handle multiple onboarding screens
            // The PageView inherently provides a sliding animation when swiped by the user.
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                // This callback is also triggered when the page changes,
                // but the listener in initState is more precise for continuous updates.
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildOnboardingPage(
                  context: context,
                  title: 'Smart Waste Management at\nYour Fingertips',
                  description:
                      'Schedule pickups, track collections,\nand keep your environment clean\neffortlessly',
                  imagePath: 'assets/images/onboarding_illustration_1.png',
                ),
                _buildOnboardingPage(
                  context: context,
                  title: 'Pickups Made Simple',
                  description:
                      'Select pickup times, track your\nwaste status, and enjoy a cleaner\nspace — all in a few taps.',
                  imagePath: 'assets/images/onboarding_illustration_2.png',
                ),
                _buildOnboardingPage(
                  context: context,
                  title: 'Join the Green\nMovement',
                  description:
                      'Recycling right and proper disposal\nhelp build a healthier planet for\neveryone',
                  imagePath: 'assets/images/onboarding_illustration_3.png',
                ),
              ],
            ),

            // Logo image positioned at the top left
            Positioned(
              top: 10,
              left: 20,
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),

            // Skip button positioned at the top right
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  // Navigate directly to the Register screen when Skip is pressed
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => Register()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),

            // Get Started Button - only visible on the last page
            if (_currentPage == _totalPages) // Conditionally render the button
              Positioned(
                bottom: 50, // Adjust position as needed
                left: 20,
                right: 20,
                child: SizedBox(
                  width: double.infinity, // Make button full width
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // This is the last page, navigate to the Register screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (ctx) => Register()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            // For pages before the last one, show a "Next" or similar button if desired, or nothing.
            else
              Positioned(
                bottom: 50, // Adjust position as needed
                left: 20,
                right: 20,
                child: SizedBox(
                  width: double.infinity, // Make button full width
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Not the last page, go to the next page
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        // Smooth animation duration
                        curve: Curves.easeIn, // Animation curve
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Next', // Changed text to "Next" for intermediate pages
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

            //Page Indicator (dots)
            Positioned(
              bottom: 15, // Position below the button
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _totalPages + 1, // +1 because pages are 0-indexed
                  (index) => _buildPageIndicator(index == _currentPage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each individual onboarding page content
  Widget _buildOnboardingPage({
    required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the top spacing to account for the logo and skip button
          const SizedBox(height: 100),

          // Title
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          // Description
          Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          const SizedBox(height: 50),

          // Illustration Image
          Center(
            // Center the image horizontally
            child: Image.asset(
              imagePath,
              height:
                  MediaQuery.of(context).size.height * 0.3, // Responsive height
              fit: BoxFit.contain, // Changed to contain to prevent cropping
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 50),

          // Note: The button is now outside this widget, handled by the Stack in build method.
        ],
      ),
    );
  }

  // Helper method for a simple page indicator dot
  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
