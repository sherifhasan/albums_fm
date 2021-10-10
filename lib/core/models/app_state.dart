import '../../data/models/album_details_response.dart';
import '../../data/models/artist_search_response.dart';
import '../../data/models/artist_top_albums_response.dart';

class AppState {
  final ArtistTopAlbums artistTopAlbums;
  final ArtistSearchResponse artistSearchResponse;
  final AlbumDetailsResponse albumDetailsResponse;
  bool isLoading;

  AppState(
      {this.artistTopAlbums = const ArtistTopAlbums.empty(),
      this.albumDetailsResponse = const AlbumDetailsResponse.empty(),
      this.artistSearchResponse = const ArtistSearchResponse.empty(),
      this.isLoading = false});

  factory AppState.loading() => AppState(isLoading: true);

  factory AppState.idle() => AppState(isLoading: false);

  AppState copyWith(
      {bool? isLoading,
      ArtistTopAlbums? artistTopAlbums,
      ArtistSearchResponse? artistSearchResponse,
      AlbumDetailsResponse? albumDetailsResponse}) {
    return AppState(
        artistTopAlbums: artistTopAlbums ?? this.artistTopAlbums,
        artistSearchResponse: artistSearchResponse ?? this.artistSearchResponse,
        albumDetailsResponse:
            albumDetailsResponse ?? this.albumDetailsResponse);
  }

  void setLoading() {
    isLoading = !isLoading;
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      artistTopAlbums.hashCode ^
      artistSearchResponse.hashCode ^
      albumDetailsResponse.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          artistTopAlbums == other.artistTopAlbums &&
          artistSearchResponse == other.artistSearchResponse &&
          albumDetailsResponse == other.albumDetailsResponse;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, artistTopAlbums: $artistTopAlbums, artistSearchResponse: $artistSearchResponse, albumDetailsResponse: $albumDetailsResponse}';
  }
}
