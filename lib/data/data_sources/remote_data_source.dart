import 'package:appsfactory_task/data/services/apis/api.dart';

import '../models/album_details_response.dart';
import '../models/artist_search_response.dart';
import '../models/artist_top_albums_response.dart';
import 'data_source.dart';

class RemoteDataSourceProvider implements DataSourceProviderI {
  final Api _api;

  RemoteDataSourceProvider(this._api);

  @override
  Future<AlbumDetailsResponse?> getAlbumDetails(String mbid) {
    return _api.getAlbumDetails(mbid);
  }

  @override
  Future<ArtistTopAlbums?> getTopAlbums(String artist) {
    return _api.getTopAlbums(artist);
  }

  @override
  Future<ArtistSearchResponse?> search(String artist) {
    return _api.search(artist);
  }
}
