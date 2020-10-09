
// import 'package:flutter/material.dart';
import 'package:flutter_itunes_player/apis/search_songs_api.dart';
import 'package:flutter_itunes_player/models/song.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('Songs Api', (){
    setUp(() {
      when(searchMusicByArtist(any)).thenAnswer(null);
      // when(searchMusicByArtist(any)).then
    });

    test('will return status 200', () async {
      String searchText = 'queen';
      List<Song> result; 
      result = await searchMusicByArtist(searchText);
      print(result);
      expect(result.isEmpty, true);
    });
  });
}