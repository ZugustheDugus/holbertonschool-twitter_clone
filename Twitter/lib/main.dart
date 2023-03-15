import 'package:flutter/material.dart';
import 'package:twitter/screens/signin_screen.dart';
// import 'package:twitter/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppState()),
        ],
        child: MaterialApp(
          title: 'Twitter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SignIn(),
        ));
  }
}