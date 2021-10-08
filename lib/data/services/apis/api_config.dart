class ApiConfig {
  static const String baseUrl = "https://ws.audioscrobbler.com/2.0/";
  static const String apiKey = "2a1742b3911a86fb35e61a2915b6f51e";
  static const String apiParams = "api_key=$apiKey&format=json";
}

class ApiMethods {
  static const String artistSearch =
      "${ApiConfig.baseUrl}?method=artist.search&${ApiConfig.apiParams}&limit=100&artist=";
  static const String topAlbums =
      "${ApiConfig.baseUrl}?method=artist.gettopalbums&${ApiConfig.apiParams}&limit=100&artist=";
  static const String albumDetails =
      "${ApiConfig.baseUrl}?method=album.getinfo&${ApiConfig.apiParams}&";
}
