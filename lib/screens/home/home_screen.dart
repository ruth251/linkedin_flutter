import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLike = false;

  void onLike() {
    setState(() {
      isLike = !isLike;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostCard(
            username: 'Alice Smith',
            position: 'Data Scientist at ABC',
            timeAgo: '1h ago',
            description:
                'Just finished an amazing AI project! Excited to share it with you all.',
            imagePath: 'assets/images/post_image2.jpg',
            profileImage: 'assets/images/profile5.jpg',
            onLike: onLike, // Pass onLike function
            isLiked: isLike,
          ),
          PostCard(
            username: 'Michael Johnson',
            position: 'Product Manager at DEF',
            timeAgo: '3h ago',
            description: 'Attended a great conference today. Lots of insights!',
            imagePath: 'assets/images/post_image1.jpg',
            profileImage: 'assets/images/profile3.jpg',
            onLike: onLike, // Pass onLike function
            isLiked: isLike,
          ),
          PostCard(
            username: 'Sophia Lee',
            position: 'UX Designer at GHI',
            timeAgo: '5h ago',
            description:
                'Exploring new design trends for 2025. What do you think?',
            imagePath: 'assets/images/post_image3.jpg',
            profileImage: 'assets/images/profile4.jpg',
            onLike: onLike, // Pass onLike function
            isLiked: isLike,
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
  final String profileImage;
  final VoidCallback onLike;
  final bool isLiked;

  const PostCard({
    super.key,
    required this.username,
    required this.position,
    required this.timeAgo,
    required this.description,
    required this.imagePath,
    required this.profileImage,
    required this.onLike,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 5),
            _buildPostDescription(),
            const SizedBox(height: 5),
            _buildPostMedia(),
            const SizedBox(height: 5),
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
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(profileImage),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                position,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Text(
                timeAgo,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            ' + Follow',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPostDescription() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      TextButton(
        onPressed: () {},
        child: const Text(
          'See more',
          style: TextStyle(
              color: Colors.blue), // Change this to your desired color
        ),
      ),
    ]);
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${isLiked ? 121 : 120} likes',
            style: const TextStyle(color: Colors.grey)),
        const Text('13 comments • 330 reposts',
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPostActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(
          isLiked ? 'assets/icons/isliked.png' : 'assets/icons/like-icon.png',
          'Like',
          onLike,
        ),
        _buildAction('assets/icons/message-icon.jpg', 'Comment', () {}),
        _buildAction('assets/icons/repost-icon.png', 'Repost', () {}),
        _buildAction('assets/icons/send-icon.png', 'Send', () {}),
      ],
    );
  }

  Widget _buildAction(String assetPath, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, width: 20, height: 20),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
