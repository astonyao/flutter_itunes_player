import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_itunes_player/models/song.dart';

Future<List<Song>> searchMusicByArtist(String artist) async {
  final Dio client = Dio();
  const String baseURL = 'https://itunes.apple.com/search?media=music&entity=musicTrack&term=';
  final String requestURL = baseURL + artist;
  Response<dynamic> responseSongs = await client.get(requestURL);
  if (responseSongs.statusCode == 200 || responseSongs.statusCode == 201) {
    dynamic data = json.decode(responseSongs.data as String);
    List<dynamic> results = data['results'] as List<dynamic>;
    List<Song> returnedSongs = results.map((dynamic json) => Song.fromJson(json)).toList();
    return returnedSongs;
  } else {
    return null;
  }
}
