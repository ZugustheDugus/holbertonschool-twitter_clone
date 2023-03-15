import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/chats_screen.dart';

class BottomMenuBar extends StatefulWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  BottomMenuBarState createState() => BottomMenuBarState();
}

class BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<AppState>(context, listen: false).setpageIndex = 0;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Consumer<AppState>(
              builder: (context, appState, child) => Icon(
                Icons.home,
                color: appState.pageIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<AppState>(context, listen: false).setpageIndex = 1;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Consumer<AppState>(
              builder: (context, appState, child) => Icon(
                Icons.search,
                color: appState.pageIndex == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<AppState>(context, listen: false).setpageIndex = 2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
            child: Consumer<AppState>(
              builder: (context, appState, child) => Icon(
                Icons.notifications_outlined,
                color: appState.pageIndex == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<AppState>(context, listen: false).setpageIndex = 3;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatsScreen()),
              );
            },
            child: Consumer<AppState>(
              builder: (context, appState, child) => Icon(
                Icons.email_outlined,
                color: appState.pageIndex == 3
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (BuildContext context) {
            return const Scaffold(
              body: Center(
                child: BottomMenuBar(),
              ),
            );
          },
        ),
      ),
    ),
  );
}