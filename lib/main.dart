import 'package:blog_app/screens/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BlogApp());
}
class BlogApp extends StatelessWidget {

  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      home: HomePage(),
    );
  }
}



