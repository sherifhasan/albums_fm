import 'package:flutter/material.dart';

class MainScreenEmptyView extends StatelessWidget {
  const MainScreenEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: const Text('No saved Albums',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey)),
    );
  }
}
