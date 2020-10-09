// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_itunes_player/main.dart';

class MockDio extends Mock implements Dio {}

void main() {
  Dio client = MockDio();

  Response<dynamic> failedAPIResponse = Response<dynamic>(
    statusCode: 404,
    data: null,
  );

  Response<dynamic> mockAPIResponse = Response<dynamic>(
    statusCode: 200, 
    data: <String, dynamic> {
    'resultCount':1,
    'results':[
        {
          'wrapperType':'track',
          'kind':'song',
          'artistId':271256,
          'collectionId':1440642493,
          'trackId':1440643139,
          'artistName':'Drake',
          'collectionName':'Take Care (Deluxe Version)',
          'trackName':'The Motto (feat. Lil Wayne) [Bonus Track]',
          'collectionCensoredName':'Take Care (Deluxe Version)',
          'trackCensoredName':'The Motto (feat. Lil Wayne) [Bonus Track]',
          'artistViewUrl':'https://music.apple.com/us/artist/drake/271256?uo=4',
          'collectionViewUrl':'https://music.apple.com/us/album/the-motto-feat-lil-wayne-bonus-track/1440642493?i=1440643139&uo=4',
          'trackViewUrl':'https://music.apple.com/us/album/the-motto-feat-lil-wayne-bonus-track/1440642493?i=1440643139&uo=4',
          'previewUrl':'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview128/v4/11/8d/5c/118d5c80-9cf3-8763-164f-46c133ec6b2d/mzaf_4957978631652780821.plus.aac.p.m4a',
          'artworkUrl30':'https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/d4/df/9a/d4df9abd-ec9d-06c2-ac90-821630b8cb8b/source/30x30bb.jpg',
          'artworkUrl60':'https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/d4/df/9a/d4df9abd-ec9d-06c2-ac90-821630b8cb8b/source/60x60bb.jpg',
          'artworkUrl100':'https://is2-ssl.mzstatic.com/image/thumb/Music128/v4/d4/df/9a/d4df9abd-ec9d-06c2-ac90-821630b8cb8b/source/100x100bb.jpg',
          'collectionPrice':10.99,
          'trackPrice':1.29,
          'releaseDate':'2011-11-15T12:00:00Z',
          'collectionExplicitness':'explicit',
          'trackExplicitness':'explicit',
          'discCount':1,
          'discNumber':1,
          'trackCount':20,
          'trackNumber':19,
          'trackTimeMillis':181560,
          'country':'USA',
          'currency':'USD',
          'primaryGenreName':'Hip-Hop/Rap',
          'contentAdvisoryRating':'Explicit',
          'isStreamable':true
        },
    ]
});

  testWidgets('Renders initial screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(MusicPlayer), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Search artist...'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);
  });

  group('Music player', () {
    setUp(() {
      
    });
  });
}
