import 'package:flutter/material.dart';

import '../../../../data/models/artist.dart';
import '../../../../router.dart';
import '../../../../shared/routes.dart';
import 'search_item.dart';

class SearchPopulatedView extends StatelessWidget {
  final List<Artist> artistsList;

  const SearchPopulatedView(this.artistsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 2.0),
      itemCount: artistsList.length,
      itemBuilder: (context, index) {
        return SearchItem(
            artistsList[index],
            () => navigationService.pushNamed(
                  RoutePaths.topAlbums,
                  arguments: artistsList[index].name,
                ));
      },
    );
  }
}
