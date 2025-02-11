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
      "time": "4h",
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
      "time": "7h",
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
      "description": " What was the bravest thing you ever did in a job interview? I was at an interview and...",
      "time": "2d",
      "reactions": "139 reactions • 23 comments",
      "icon": Icons.chat
    },
    {
      "title": "You're a top applicant for React Native Developer at Bacancy",
      "description": " and 5+ other jobs.",
      "time": "2d",
      "icon": Icons.star
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(filters.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        filters[index],
                        style: TextStyle(
                          color: selectedFilterIndex == index ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: selectedFilterIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          selectedFilterIndex = index;
                        });
                      },
                      selectedColor: Colors.green.shade300,
                      backgroundColor: Colors.green.shade100,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: Icon(notification["icon"], color: Colors.green.shade800),
                        ),
                        const SizedBox(width: 12),
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
                                      style: const TextStyle(fontWeight: FontWeight.w400),
                                    ),
                                    if (notification.containsKey("boldText"))
                                      TextSpan(
                                        text: " ${notification["boldText"]}",
                                        style: const TextStyle(fontWeight: FontWeight.w500),
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
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              if (notification.containsKey("reactions")) ...[
                                const SizedBox(height: 4),
                                Text(
                                  notification["reactions"],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
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
