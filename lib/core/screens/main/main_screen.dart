import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../database_setup.dart';
import '../../../router.dart';
import '../../../shared/routes.dart';
import 'widgets/main_screen_empty_view.dart';
import 'widgets/main_screen_populated_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlbumsFm'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => navigationService.pushNamed(RoutePaths.search),
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: _buildVisible(),
    );
  }

  Widget _buildVisible() {
    if (favouriteBox.keys.isNotEmpty) {
      return MainScreenPopulatedView(favouriteBox.values.toList());
    } else {
      return const MainScreenEmptyView();
    }
  }
}
