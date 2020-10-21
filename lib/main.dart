import 'package:flutter/material.dart';
import 'package:mvvm_http/features/post/view/post_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: PostView(),
    );
  }
}
