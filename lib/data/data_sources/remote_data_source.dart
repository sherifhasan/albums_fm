import 'package:appsfactory_task/data/services/apis/api.dart';

import '../models/album_details_response.dart';
import '../models/artist_search_response.dart';
import '../models/artist_top_albums_response.dart';
import 'data_source.dart';

class RemoteDataSourceProvider implements DataSourceProviderI {
  final Api _api = Api();

  @override
  Future<AlbumDetailsResponse?> getAlbumDetails(
      String artist, String albumName) {
    return _api.getAlbumDetails(artist, albumName);
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
