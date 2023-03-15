import 'package:flutter/material.dart';
import 'package:twitter/assets/post.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;
  final String postText;
  final List<String> hashtags;

  const PostWidget({
    Key? key,
    required this.name,
    required this.username,
    required this.imgUrl,
    required this.isVerified,
    required this.postText,
    required this.hashtags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: 5),
                          Icon(
                            Icons.check_circle,
                            color: Theme.of(context).primaryColor,
                            size: 15,
                          ),
                        ],
                        const SizedBox(width: 5),
                        Text(
                          '@$username',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '2m',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      postText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (hashtags.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          ...hashtags.map(
                            (tag) => Text(
                              '#$tag',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 20,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.replay,
                              size: 20,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.pink[600],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '2',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.pink[600]),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.share,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Users Search Results'),
      ),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          final post = postList[index];
          return PostWidget(
            name: post['name'],
            username: post['username'],
            imgUrl: post['imgUrl'],
            isVerified: post['isVerified'],
            postText: post['postText'],
            hashtags: post['hashtags'],
          );
        },
      ),
    ),
  ));
}