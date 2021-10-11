import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../data/services/navigation/navigation_service.dart';
import '../../../database_setup.dart';
import '../../../locator_setup.dart';
import '../../../shared/routes.dart';
import 'widgets/main_screen_empty_view.dart';
import 'widgets/main_screen_populated_view.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, Store<AppState> store) {
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
        body: _buildVisible(store),
      );
    });
  }

  Widget _buildVisible(Store<AppState> store) {
    if (favouriteBox.keys.isNotEmpty) {
      return MainScreenPopulatedView(favouriteBox.values.toList(), store);
    } else {
      return const MainScreenEmptyView();
    }
  }
}
