import 'package:flutter/material.dart';
import 'package:linkedin_flutter/routes/app_routes.dart';
import 'package:linkedin_flutter/screens/authentication/sign_in/signin_page.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/add_name.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> pages = [
    {
      "image": "assets/images/pic1.png",
      "text": "Find and land your next job"
    },
    {
      "image": "assets/images/pic2.png",
      "text": "Build your network on the go"
    },
    {
      "image": "assets/images/pic3.png",
      "text": "Find and land your next job"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20), // Spacing for status bar
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                'assets/images/linkedin_offical_logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // PageView for scrolling images & text
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      pages[index]["image"]!,
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pages[index]["text"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Page Indicator (Dots)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Terms and Privacy Policy Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "By clicking Agree & Join or Continue, you agree to LinkedIn's "
              "User Agreement, Privacy Policy and Cookie Policy.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),

          const SizedBox(height: 20),

          // Agree & Join Button
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const AddName(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Agree & Join",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Continue with Apple Button
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  print("Continue with Apple clicked");
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(Icons.apple, color: Colors.black, size: 24),
                label: const Text(
                  "Continue with Apple",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Continue with Google Button
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  print("Continue with Google clicked");
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: Image.asset('assets/images/google_icon.png', width: 24, height: 24),
                label: const Text(
                  "Continue with Google",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Sign in Text
          GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => const SignInPage(),
                ),
              );
            },
            child: const Text(
              "Sign in",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
