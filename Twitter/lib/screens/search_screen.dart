import 'package:flutter/material.dart';
import '../widgets/entry_field.dart';
import '../widgets/users_search_results_widget.dart';
import '../assets/user_list.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/200'),
        ),
        title: CustomEntryField(
          hint: 'Search',
          controller: _searchController,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          final user = userList[index];
          return UsersSearchResultsWidget(
            name: user['name'],
            username: user['username'],
            imgUrl: user['imgUrl'],
            isVerified: user['isVerified'],
          );
        },
      ),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SearchScreen(),
  ));
}