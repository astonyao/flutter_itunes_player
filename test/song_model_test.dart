import 'package:flutter_itunes_player/models/song.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('constructs a song', () {
    Song song = Song(
      title: 'we will rock you',
      artistName: 'Queen',
      album: 'News of the world',
      artworkUrl: 'somelink',
      trackId: 123,
      previewUrl: 'someurl',
    );
    expect(song.title, equals('we will rock you'));
    expect(song.artistName, equals('Queen'));
    expect(song.album, equals('News of the world'));
    expect(song.trackId, equals(123));
    expect(song.previewUrl, equals('someurl'));
  });

  // Todo - test model conversion from raw json input.
}
