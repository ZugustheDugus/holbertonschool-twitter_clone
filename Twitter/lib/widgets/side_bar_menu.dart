import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 275,
            child: DrawerHeader(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.pngfind.com/pngs/m/508-5081690_clifford-evans-mike-blank-avatar-icon-png-transparent.png'),
                      radius: 35,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 15),
                      child: Text(
                        'UserName',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey[800],
                                ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('0 Followers',
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        Expanded(
                            child: Text('0 Following',
                                style: Theme.of(context).textTheme.titleMedium))
                      ],
                    ),
                  ]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            iconColor: Colors.grey[800],
            title: const Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.format_list_bulleted),
            iconColor: Colors.grey[800],
            title: const Text('Lists'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            iconColor: Colors.grey[800],
            title: const Text('Bookmark'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.flash_on),
            iconColor: Colors.grey[800],
            title: const Text('Moments'),
            onTap: () => {},
          ),
          Divider(
            color: Theme.of(context).primaryColorLight,
          ),
          ListTile(
            title: const Text('Settings and privacy'),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('Help Center'),
            onTap: () => {},
          ),
          Divider(
            color: Theme.of(context).primaryColorLight,
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SideBarMenu(),
  ));
}
