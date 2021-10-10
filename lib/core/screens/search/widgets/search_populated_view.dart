import 'package:flutter/material.dart';

import '../../../../data/models/artist.dart';
import '../../../../data/services/navigation/navigation_service.dart';
import '../../../../locator_setup.dart';
import '../../../../shared/routes.dart';
import 'search_item.dart';

class SearchPopulatedView extends StatelessWidget {
  SearchPopulatedView(this.artistsList, {Key? key}) : super(key: key);
  final navigationService = locator<NavigationService>();
  final List<Artist> artistsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
