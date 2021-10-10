import '../models/album_details_response.dart';
import '../models/artist_search_response.dart';
import '../models/artist_top_albums_response.dart';

abstract class DataSourceProviderI {
  Future<ArtistSearchResponse?> search(String artist);

  Future<ArtistTopAlbums?> getTopAlbums(String artist);

  Future<AlbumDetailsResponse?> getAlbumDetails(String mbid);
}
