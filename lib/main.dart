import 'package:fake_amazon/articles_list_screen.dart';
import 'package:fake_amazon/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Amazon',
      theme: ThemeData(
        fontFamily: 'Amazon',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            NavBar(),
            Expanded(child: ArticlesList()),
          ],
        ),
      ),
    );
  }
}
