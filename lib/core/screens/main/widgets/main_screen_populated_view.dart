import 'package:flutter/material.dart';

import '../../../../data/models/album_details_response.dart';
import '../../../../router.dart';
import '../../../../shared/routes.dart';
import '../../widgets/album_item.dart';

class MainScreenPopulatedView extends StatelessWidget {
  final List<AlbumDetailsResponse> albums;

  const MainScreenPopulatedView(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        var imageUrl =
            "https://via.placeholder.com/300x300?text=No%20Image%20found";
        if (albums[index].image[3].text != null) {
          imageUrl = albums[index].image[3].text!;
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
