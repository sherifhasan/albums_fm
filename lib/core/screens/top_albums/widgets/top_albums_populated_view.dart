import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/album.dart';
import '../../../../data/services/navigation/navigation_service.dart';
import '../../../../locator_setup.dart';
import '../../../../shared/constants.dart';
import '../../../actions/album_details/albums_details_fetch_action.dart';
import '../../../models/app_state.dart';
import '../../widgets/album_item.dart';

class TopAlbumsScreenPopulatedView extends StatelessWidget {
  TopAlbumsScreenPopulatedView(this.albums, this.store, {Key? key})
      : super(key: key);
  final List<Album> albums;
  final Store<AppState> store;

  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        var imageUrl = AppImages.networkNotAvailableImage;
        if (albums[index].imageList[3].text != null &&
            albums[index].imageList[3].text!.isNotEmpty) {
          imageUrl = albums[index].imageList[3].text!;
        }
        return AlbumItem(albums[index].name, networkImageUrl: imageUrl,
            openDetails: () {
          store.dispatch(AlbumDetailsFetchAction(
              albums[index].artist.name, albums[index].name));
        });
      },
    );
  }
}
