import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Column(
        children:  [
          PostCard(
            username: 'Alice Smith',
            position: 'Data Scientist at ABC',
            timeAgo: '1h ago',
            description: 'Just finished an amazing AI project! Excited to share it with you all.',
            imagePath: 'assets/images/post_image2.jpg',
          ),
          PostCard(
            username: 'Michael Johnson',
            position: 'Product Manager at DEF',
            timeAgo: '3h ago',
            description: 'Attended a great conference today. Lots of insights!',
            imagePath: 'assets/images/post_image1.jpg',
          ),
          PostCard(
            username: 'Sophia Lee',
            position: 'UX Designer at GHI',
            timeAgo: '5h ago',
            description: 'Exploring new design trends for 2025. What do you think?',
            imagePath: 'assets/images/post_image3.jpg',
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String position;
  final String timeAgo;
  final String description;
  final String imagePath;

  const PostCard({
    super.key,
    required this.username,
    required this.position,
    required this.timeAgo,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildPostDescription(),
            const SizedBox(height: 8),
            _buildPostMedia(),
            const SizedBox(height: 8),
            _buildPostStats(),
            const Divider(),
            _buildPostActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(position, style: const TextStyle(color: Colors.grey)),
              Text(timeAgo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
        TextButton(onPressed: () {}, child: const Text('Connect')),
      ],
    );
  }

  Widget _buildPostDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(onPressed: () {}, child: const Text('See more')),
      ],
    );
  }

  Widget _buildPostMedia() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPostStats() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('120 likes', style: TextStyle(color: Colors.grey)),
        Text('13 comments • 330 reposts', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(Icons.thumb_up_off_alt, 'Like', () {}),
        _buildAction(Icons.comment, 'Comment', () {}),
        _buildAction(Icons.share, 'Share', () {}),
      ],
    );
  }

  Widget _buildAction(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 20, color: Colors.grey),
          onPressed: onPressed,
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
