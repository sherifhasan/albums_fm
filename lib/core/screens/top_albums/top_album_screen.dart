import 'package:appsfactory_task/core/actions/top_albums/top_albums_fetch_action.dart';
import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:appsfactory_task/core/screens/top_albums/widgets/top_albums_populated_view.dart';
import 'package:appsfactory_task/core/screens/widgets/empty_view.dart';
import 'package:appsfactory_task/core/screens/widgets/loading_view.dart';
import 'package:appsfactory_task/data/models/artist_top_albums_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../router.dart';
import '../../../shared/routes.dart';

class TopAlbumsScreen extends StatelessWidget {
  final String artist;

  const TopAlbumsScreen(this.artist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        onInit: (Store<AppState> store) =>
            store.dispatch(TopAlbumsFetchAction(artist)),
        builder: (BuildContext context, Store<AppState> store) {
          return Scaffold(
            appBar: AppBar(
              title: Text(artist),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () =>
                        navigationService.pushNamed(RoutePaths.search),
                    icon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ))
              ],
            ),
            body: _buildVisible(store.state),
          );
        });
  }

  Widget _buildVisible(AppState state) {
    if (state.isLoading) {
      return const LoadingView();
    } else if (state.artistTopAlbums == const ArtistTopAlbums.empty()) {
      return const EmptyView();
    } else if (state.artistTopAlbums != const ArtistTopAlbums.empty()) {
      return TopAlbumsScreenPopulatedView(state.artistTopAlbums.albums);
    }
    throw ArgumentError('No view for state: $state');
  }
}
