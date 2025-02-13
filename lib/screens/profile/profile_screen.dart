import 'package:flutter/material.dart';
import 'package:linkedin_flutter/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/main");
          },
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.searchScreen);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black54),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/settings");
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120,
                color: Colors.grey[300],
              ),
              Positioned(
                top: 75,
                left: 16,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.teal,
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Ruth Menber",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text("Student at Bits College"),
                  const Text("Ethiopia", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Color(0xFF003366)), // Darker blue border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Matching border radius
                          ),
                        ),
                        child: const Text(
                          "Open to",
                          style: TextStyle(
                            color: Color(0xFF003366), // Darker blue text color
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF003366)), // Darker blue border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Matching border radius
                          ),
                        ),
                        child: const Text(
                          "Add section",
                          style: TextStyle(
                            color: Color(0xFF003366), // Darker blue text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF003366)), // Darker blue border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Matching border radius
                          ),
                        ),
                        child: const Text(
                          "Enhance Profile",
                          style: TextStyle(
                            color: Color(0xFF003366), // Darker blue text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ListTile(
                    tileColor: Colors.grey,
                    title: Text("Open to work"),
                    subtitle: Text("Software Engineer roles"),
                    trailing: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userGroup, size: 20),
            label: 'Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bell, size: 20),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.briefcase, size: 20),
            label: 'Jobs',
          ),
        ],
      ),
    );
  }
}
