import 'package:flutter/material.dart';

import 'data/services/navigation/navigation_service_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlbumsFm',
      navigatorKey: globalNavigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
