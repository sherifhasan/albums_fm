import 'package:flutter/material.dart';

class TopAlbumsEmptyView extends StatelessWidget {
  const TopAlbumsEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: const Text('Nothing to show',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey)),
    );
  }
}
