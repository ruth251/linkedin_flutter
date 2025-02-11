import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_flutter/routes/app_routes.dart';
import 'package:linkedin_flutter/screens/home/home_screen.dart';
import 'package:linkedin_flutter/screens/notification/notification_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text("Network Screen")),
    const NotificationsScreen(),
    const Center(child: Text("Jobs Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipOval(
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.searchScreen);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: IconButton(
              icon: const ImageIcon(
                AssetImage('assets/icons/message-icon.png'),
              ),
              onPressed: () {
                // Navigate to Messages
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const Text(
                    'Ruth menber',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to View Profile
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('View Profile'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('31 profile viewers'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('6 post impressions'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Puzzle games', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Saved posts', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Groups', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
