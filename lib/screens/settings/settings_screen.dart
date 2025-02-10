import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        children: [
           SizedBox(height: 16),
          Row(
            children: [
               CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 20,
                child: Text(
                  "R",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
               SizedBox(width: 10),
               Text(
                "Settings",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
           SizedBox(height: 24),
          _buildListTile(Icons.person_outline, "Account preferences"),
          _buildListTile(Icons.lock_outline, "Sign in & security"),
          _buildListTile(Icons.visibility_outlined, "Visibility"),
          _buildListTile(Icons.shield_outlined, "Data privacy"),
          _buildListTile(Icons.article_outlined, "Advertising data"),
          _buildListTile(Icons.notifications_outlined, "Notifications"),
          
           Divider(), 
          _buildTextTile("Help Center"),
          _buildTextTile("Professional Community Policies"),
          _buildTextTile("Privacy Policy"),
          _buildTextTile("Accessibility"),
          _buildTextTile("Recommendation Transparency"),
          _buildTextTile("User Agreement"),
          _buildTextTile("End User License Agreement"),
          _buildSignOutTile("Sign Out"),
          _buildVersionTile("VERSION: 9.30.6435"),
        ],
      ),
    );
  }

  /// Creates a ListTile with an icon and text
  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title, style:  TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }

  /// Creates a simple text-only tile
  Widget _buildTextTile(String title) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style:  TextStyle(fontSize: 16)),
    );
  }

  // Creates a Sign Out tile with special styling
  Widget _buildSignOutTile(String title) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Creates a Version Number text at the bottom
  Widget _buildVersionTile(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style:  TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

