import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../../../../data/services/navigation/navigation_service.dart';
import '../../../../database_setup.dart';
import '../../../../locator_setup.dart';
import '../../../../shared/routes.dart';
import '../../../models/app_state.dart';
import '../../widgets/album_item.dart';

class MainScreenPopulatedView extends StatelessWidget {
  MainScreenPopulatedView(this.store, {Key? key}) : super(key: key);
  final Store<AppState> store;

  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0),
      itemCount: favouriteBox.values.toList().length,
      itemBuilder: (context, index) {
        return AlbumItem(favouriteBox.values.toList()[index].name,
            networkImageUrl: favouriteBox.values
                .toList()[index]
                .imageList![3]
                .text, openDetails: () async {
          navigationService.pushNamed(
            RoutePaths.details,
            arguments: favouriteBox.values.toList()[index],
          );
        });
      },
    );
  }
}
