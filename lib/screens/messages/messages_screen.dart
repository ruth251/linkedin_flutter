import 'package:flutter/material.dart'; 


class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewMessageScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          MessageTile(
            senderName: 'Kristen J.',
            message: "Hi Fenet,\nHere's a quick tip that'll make you 2x more likely...",
            time: 'Jan 15',
          ),
          // Add more MessageTile widgets here for additional messages
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String senderName;
  final String message;
  final String time;

  const MessageTile({
    Key? key,
    required this.senderName,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(senderName[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      title: Text(
        senderName,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
      ),
      trailing: Text(
        time,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

class NewMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Message', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ), //app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'To: Type a name or multiple names',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  SuggestedContact(
                    name: 'Ruth Member',
                    subtitle: 'Student at Bits college',
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

class SuggestedContact extends StatelessWidget {
  final String name;
  final String subtitle;

  const SuggestedContact({
    Key? key,
    required this.name,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}