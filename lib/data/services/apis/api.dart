import 'dart:async';

import 'package:appsfactory_task/data/models/album_details_response.dart';
import 'package:appsfactory_task/data/models/artist_top_albums_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/artist_search_response.dart';
import 'api_config.dart';

class Api {
  Future<ArtistSearchResponse?> search(String artist) async {
    final client = Dio();
    final url = '${ApiMethods.artistSearch}$artist';
    try {
      final response = await client.get(url,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 && response.data != null) {
        return compute(parseSearchResponse, response.data);
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
      }
    } on DioError catch (error) {
      debugPrint(error.message);
    } finally {
      client.clear();
    }
    return null;
  }

  Future<ArtistTopAlbums?> getTopAlbums(String artist) async {
    final client = Dio();
    final url = '${ApiMethods.topAlbums}$artist';
    try {
      final response = await client.get(url,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 && response.data != null) {
        return compute(parseArtistTopAlbumsResponse, response.data);
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
      }
    } on DioError catch (error) {
      debugPrint(error.message);
    } finally {
      client.clear();
    }
    return null;
  }

  Future<AlbumDetailsResponse?> getAlbumDetails(
      String artist, albumName) async {
    final client = Dio();
    final url = '${ApiMethods.albumDetails}artist=$artist&album=$albumName';
    try {
      final response = await client.get(url,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 && response.data != null) {
        return compute(parseAlbumDetailsResponse, response.data);
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
      }
    } on DioError catch (error) {
      debugPrint(error.message);
    } finally {
      client.clear();
    }
    return null;
  }
}

ArtistSearchResponse parseSearchResponse(response) =>
    ArtistSearchResponse.fromJson(response);

ArtistTopAlbums parseArtistTopAlbumsResponse(response) =>
    ArtistTopAlbums.fromJson(response);

AlbumDetailsResponse parseAlbumDetailsResponse(response) =>
    AlbumDetailsResponse.fromJson(response);
