import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget({
    Key? key,
    required this.name,
    required this.username,
    required this.imgUrl,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(imgUrl),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isVerified)
                      const SizedBox(
                        width: 5.0,
                      ),
                    if (isVerified)
                      Icon(
                        Icons.verified,
                        color: Theme.of(context).primaryColor,
                        size: 18.0,
                      ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  '@$username',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Users Search Results'),
      ),
      body: const Center(
        child: UsersSearchResultsWidget(
          name: 'John Moe',
          username: 'johndoe',
          imgUrl: 'https://picsum.photos/200',
          isVerified: true,
        ),
      ),
    ),
  ));
}
