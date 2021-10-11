import '../data_sources/data_source.dart';
import '../models/album_details_response.dart';
import '../models/artist_search_response.dart';
import '../models/artist_top_albums_response.dart';

class AppRepository {
  AppRepository(this._remoteDataSource);

  final DataSourceProviderI _remoteDataSource;

  Future<AlbumDetailsResponse?> getAlbumDetails(
      String artist, String albumName) {
    return _remoteDataSource.getAlbumDetails(artist, albumName);
  }

  Future<ArtistTopAlbums?> getTopAlbums(String artist) {
    return _remoteDataSource.getTopAlbums(artist);
  }

  Future<ArtistSearchResponse?> search(String artist) {
    return _remoteDataSource.search(artist);
  }
}
