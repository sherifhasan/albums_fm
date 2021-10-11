import 'package:appsfactory_task/core/screens/details/album_details_screen.dart';
import 'package:appsfactory_task/data/models/album_details_response.dart';
import 'package:flutter/material.dart';

import 'core/screens/main/main_screen.dart';
import 'core/screens/search/search_screen.dart';
import 'core/screens/top_albums/top_album_screen.dart';
import 'shared/routes.dart';

class AppRouter {
  static dynamic routes() => {
        RoutePaths.initialRoute: (BuildContext context) => MainScreen(),
        RoutePaths.search: (BuildContext context) => const SearchScreen(),
        RoutePaths.topAlbums: (BuildContext context) {
          final artistName =
              ModalRoute.of(context)!.settings.arguments as String;
          return TopAlbumsScreen(artistName);
        },
        RoutePaths.details: (BuildContext context) {
          final albumDetails = ModalRoute.of(context)!.settings.arguments
              as AlbumDetailsResponse;
          return AlbumDetailsScreen(albumDetails);
        }
      };
}
