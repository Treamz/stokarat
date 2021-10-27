import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stokarat/models/feed.dart';

class FeedProvider {
  final Dio _dio = Dio();

  Future<List<Feed>> getFeed() async {
    _dio.options.headers['x-rapidapi-host'] = "free-football-soccer-videos.p.rapidapi.com";
    _dio.options.headers['x-rapidapi-key'] = "7da7362db6msh59bef8e6efacc55p1e765djsnf08c0e122b3e";

    Response data = await _dio.get('https://free-football-soccer-videos.p.rapidapi.com/');
    // Await the http get response, then decode the json-formatted response.
    if (data.statusCode == 200) {
      // return data.data;
      print(data.data.runtimeType);
      List<dynamic> result = data.data;

      return result.map((json) => Feed.fromJson(json)).toList();
    }
    else {
      throw Exception('Error fetching Feed');
    }
  }
}