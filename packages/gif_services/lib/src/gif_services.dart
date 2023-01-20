// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:http/http.dart' as http;

/// {@template gif_services}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class GifServices {
  /// {@macro gif_services}
  GifServices({
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  // ignore: public_member_api_docs
  final http.Client httpClient;
  final String _baseUrl = 'api.giphy.com';
  final String _endPoint = 'v1/gifs/trending';
  final String _apiKey = 'J0E4iOHeerHBWldNgKg0kofSVflNELeK';

  ///Method to fetch gifs url from api
  Future<List<String>> fetchGifs() async {
    final url = Uri.https(
      _baseUrl,
      _endPoint,
      {'api_key': _apiKey, 'limit': '3', 'rating': 'g'},
    );

    http.Response response;
    List<dynamic> body;

    try {
      response = await httpClient.get(url);
    } on Exception {
      throw Exception();
    }

    if (response.statusCode != 200) {
      throw HttpRequestException();
    }

    try {
      body = jsonDecode(response.body)['data'] as List;
    } on Exception {
      throw JsonDecodeException();
    }

    // ignore: lines_longer_than_80_chars
    return body
        .map((url) => url['images']['original']['url'].toString())
        .toList();
  }
}

// ignore: public_member_api_docs
class HttpRequestException implements Exception {}

// ignore: public_member_api_docs
class JsonDecodeException implements Exception {}
