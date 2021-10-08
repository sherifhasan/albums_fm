import 'dart:async';

import '../../models/artist_search_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'api_config.dart';

class Api {
  Future<ArtistSearchResponse?> search(String artist) async {
    final client = Dio();
    final url = '${ApiMethods.artistSearch}$artist';
    try {
      final response = await client.get(url,
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 && response.data != null) {
        return compute(parseResponse, response.data);
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

ArtistSearchResponse parseResponse(response) =>
    ArtistSearchResponse.fromJson(response);
