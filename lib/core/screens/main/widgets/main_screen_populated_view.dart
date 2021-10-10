import 'package:appsfactory_task/data/services/navigation/navigation_service.dart';
import 'package:appsfactory_task/locator_setup.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/album_details_response.dart';
import '../../../../shared/routes.dart';
import '../../widgets/album_item.dart';

class MainScreenPopulatedView extends StatelessWidget {
  MainScreenPopulatedView(this.albums, {Key? key}) : super(key: key);
  final List<AlbumDetailsResponse> albums;

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
        return AlbumItem(albums[index].name, imageUrl,
            openDetails: () => navigationService.pushNamed(
                  RoutePaths.details,
                  arguments: albums[index],
                ));
      },
    );
  }
}
