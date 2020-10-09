class Song {
  String title;
  String album;
  String artistName;
  String artworkUrl;
  String previewUrl;
  int trackId;

  Song({this.title, this.album, this.artistName, this.artworkUrl, this.previewUrl, this.trackId});

  factory Song.fromJson(dynamic json) {
    return Song(
      title: json['trackName'] as String,
      album: json['collectionName'] as String,
      artistName: json['artistName'] as String,
      artworkUrl: json['artworkUrl100'] as String,
      previewUrl: json['previewUrl'] as String,
      trackId: json['trackId'] as int,
    );
  }
}
