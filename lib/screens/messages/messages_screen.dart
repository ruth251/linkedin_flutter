import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int selectedFilterIndex = 0;

  static const List<String> filters = ["Focused", "Jobs", "Unread", "Drafts"];
  static const List<Map<String, dynamic>> messages = [
    {
      "name": "Kristen J.",
      "title": "LinkedIn Offer",
      "message": "Search from millions of open jobs on LinkedIn...",
      "time": "7:37 am",
      "avatar": "assets/profile1.jpg",
    },
    {
      "name": "Rediet Atsede",
      "message": "heyy",
      "time": "Wed",
    },
    {
      "name": "The LinkedIn Team",
      "title": "Welcome to LinkedIn!",
      "message": "3 important tips to get you started.",
      "time": "Jan 18",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/main");
          },
        ),
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search messages',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
            ),
          ),
        ),
        actions: [
          Icon(Icons.more_vert),
          SizedBox(width: 10),
          Icon(Icons.create),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (context, index) {
                  final isSelected = selectedFilterIndex == index;
                  return ChoiceChip(
                    label: Text(
                      filters[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedFilterIndex = index;
                      });
                    },
                    selectedColor: Colors.green.shade400,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: isSelected ? Colors.transparent : Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        backgroundImage: message.containsKey("avatar")
                            ? AssetImage(message["avatar"] as String)
                            : null,
                        child: message.containsKey("avatar")
                            ? null
                            : Icon(Icons.person, color: Colors.green.shade800),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message["name"],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (message.containsKey("title"))
                              Text(
                                message["title"],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            Text(
                              message["message"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message["time"],
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
