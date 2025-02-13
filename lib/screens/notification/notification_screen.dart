import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedFilterIndex = 0;

  static const List<String> filters = ["All", "Jobs", "My posts", "Mentions"];
  static const List<Map<String, dynamic>> notifications = [
    {
      "title": "Software Engineer: 26 opportunities in Ethiopia",
      "time": "14h",
      "button": "View jobs",
      "icon": Icons.work
    },
    {
      "title": "Develop skills related to your Software Engineer job alert for free: JavaScript Essential Training.",
      "time": "4h",
      "icon": Icons.play_circle_fill
    },
    {
      "title": "You may know ",
      "boldText": "Alazar Lemma",
      "description": ". Add to your network",
      "time": "2d",
      "icon": Icons.person
    },
    {
      "title": "Intern (Fleet) at World Food Programme",
      "description": " and 9 other recommendations for you.",
      "time": "1d",
      "button": "View jobs",
      "icon": Icons.business
    },
    {
      "title": "Suggested for you:",
      "description": " What was the bravest thing you ever did in a job interview?",
      "time": "2h",
      "reactions": "707 reactions • 65 comments",
      "icon": Icons.chat
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: Icon(notification["icon"], color: Colors.green.shade800),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 15, color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: notification["title"],
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  if (notification.containsKey("boldText"))
                                    TextSpan(
                                      text: " ${notification["boldText"]}",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  if (notification.containsKey("description"))
                                    TextSpan(
                                      text: notification["description"],
                                      style: const TextStyle(fontWeight: FontWeight.w400),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              notification["time"],
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            if (notification.containsKey("reactions")) ...[
                              const SizedBox(height: 4),
                              Text(
                                notification["reactions"],
                                style: const TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                            if (notification.containsKey("button")) ...[
                              const SizedBox(height: 6),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                child: Text(notification["button"] as String),
                              ),
                            ],
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
