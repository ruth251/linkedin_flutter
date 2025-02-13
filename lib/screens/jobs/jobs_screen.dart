import'package:flutter/material.dart';

class JobsPage extends StatefulWidget{

  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search jobs'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Fenet, are you hiring?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Post a free job and add the #Hiring frame to make a hire, fast.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action for hiring button
              },
              child: Column(
                children: [
                  Text('Fenet dagne', style: TextStyle(fontSize: 18)),
                  Text('#I am hiring!', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Top job picks for you',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  JobCard(
                    title: 'Front Office Receptionist - DT Addis Ababa',
                    company: 'Hilton',
                  ),
                  JobCard(
                    title: 'Sales Development Representative - Freelance, Remote',
                    company: 'Magic',
                  ),
                  JobCard(
                    title: 'Sales Executive (Fixed - Ethiopia)',
                    company: 'Ethiopia',
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

class JobCard extends StatelessWidget {
  final String title;
  final String company;

  JobCard({required this.title, required this.company});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(company, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}