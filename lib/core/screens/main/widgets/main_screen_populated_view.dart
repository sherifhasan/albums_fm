import 'package:appsfactory_task/core/actions/album_details/albums_details_fetch_action.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/album_details_response.dart';
import '../../../../data/services/navigation/navigation_service.dart';
import '../../../../locator_setup.dart';
import '../../../../shared/routes.dart';
import '../../../../shared/utlis.dart';
import '../../../models/app_state.dart';
import '../../widgets/album_item.dart';

class MainScreenPopulatedView extends StatelessWidget {
  MainScreenPopulatedView(this.albums, this.store, {Key? key})
      : super(key: key);
  final List<AlbumDetailsResponse> albums;
  final Store<AppState> store;

  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        var imageUrl =
            "https://via.placeholder.com/300x300?text=No%20Image%20found";
        if (albums[index].imageList[3].text != null) {
          imageUrl = albums[index].imageList[3].text!;
        }
        return AlbumItem(albums[index].name, imageUrl, openDetails: () async {
          if (await isInternetConnected()) {
            store.dispatch(AlbumDetailsFetchAction(
                albums[index].artist, albums[index].name));
          } else {
            navigationService.pushNamed(
              RoutePaths.details,
              arguments: albums[index],
            );
          }
        });
      },
    );
  }
}
