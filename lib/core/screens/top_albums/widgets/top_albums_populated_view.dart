import 'package:flutter/material.dart';

import '../../../../data/models/album.dart';
import '../../../../router.dart';
import '../../../../shared/routes.dart';
import '../../widgets/album_item.dart';

class TopAlbumsScreenPopulatedView extends StatelessWidget {
  final List<Album> albums;

  const TopAlbumsScreenPopulatedView(this.albums, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0),
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
