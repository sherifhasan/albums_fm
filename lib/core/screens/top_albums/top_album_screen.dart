import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../data/models/artist_top_albums_response.dart';
import '../../actions/top_albums/top_albums_fetch_action.dart';
import '../../models/app_state.dart';
import '../widgets/empty_view.dart';
import '../widgets/loading_view.dart';
import 'widgets/top_albums_populated_view.dart';

class TopAlbumsScreen extends StatelessWidget {
  const TopAlbumsScreen(this.artist, {Key? key}) : super(key: key);
  final String artist;

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
            ),
            body: _buildVisible(store),
          );
        });
  }

  Widget _buildVisible(Store<AppState> store) {
    if (store.state.isLoading) {
      return const LoadingView();
    } else if (store.state.artistTopAlbums == const ArtistTopAlbums.empty()) {
      return const EmptyView();
    } else if (store.state.artistTopAlbums != const ArtistTopAlbums.empty()) {
      return TopAlbumsScreenPopulatedView(store.state.artistTopAlbums.albums,store);
    }
    throw ArgumentError('No view for state: ${store.state}');
  }
}
