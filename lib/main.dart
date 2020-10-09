import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:flutter_itunes_player/apis/search_songs_api.dart';
import 'package:flutter_itunes_player/models/song.dart';
import 'package:flutter_itunes_player/widgets/music_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MusicPlayer(),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key key}) : super(key: key);
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioManager audioManagerInstance = AudioManager.instance;
  final TextEditingController _searchTextController = TextEditingController();
  String _searchText = '';
  List<Song> songs = <Song>[];

  bool shouldShowControlPanel = false;
  bool showResultCount = false;

  int currentSongTrackId;

  @override
  void initState() {
    super.initState();
    setupAudioPlayerEvents();
  }

  _MusicPlayerState() {
    _searchTextController.addListener(() {
      if (_searchTextController.text.isEmpty) {
        setState(() {
          _searchText = '';
        });
      } else {
        setState(() {
          _searchText = _searchTextController.text;
        });
      }
    });
  }

  PreferredSizeWidget searchBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TextField(
        onEditingComplete: () async {
          await getSongsFromServer(context);
        },
        controller: _searchTextController,
        decoration: InputDecoration(hintText: 'Search artist...'),
      ),
      leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            await getSongsFromServer(context);
          }),
    );
  }

  Future<void> getSongsFromServer(BuildContext context) async {
    songs = await searchMusicByArtist(_searchText);
    if (songs.isNotEmpty) {
      showResultCount = true;
    }
    clearSearchBarInput(context);
  }

  void clearSearchBarInput(BuildContext context) {
    FocusScope.of(context).unfocus();
    _searchTextController.clear();
  }

  Widget songList(BuildContext context, List<Song> songs) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            selected: currentSongTrackId == songs[index].trackId,
            leading: Image.network(songs[index].artworkUrl),
            title: Text(songs[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(songs[index].artistName), Text(songs[index].album)],
            ),
            isThreeLine: true,
            onTap: () {
              showControlPanel();
              highlightCurrentTrack(songs[index].trackId);
              playSelectedSong(songs, index);
            },
          );
        },
      ),
    );
  }

  void playSelectedSong(List<Song> songs, int index) {
    audioManagerInstance.start(songs[index].previewUrl, songs[index].title, cover: songs[index].artworkUrl);
  }

  void showControlPanel() {
    shouldShowControlPanel = true;
  }

  void highlightCurrentTrack(int trackId) {
    currentSongTrackId = trackId;
  }

  void setupAudioPlayerEvents() {
    audioManagerInstance.onEvents((AudioManagerEvents events, dynamic args) {
      switch (events) {
        case AudioManagerEvents.start:
          break;
        case AudioManagerEvents.seekComplete:
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          currentSongTrackId = -1; // remove ui indication when a song is playing.
          setState(() {});
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showResultCount) Text('Found ${songs.length} results', style: TextStyle(fontSize: 18)),
            Container(child: songList(context, songs)),
            if (shouldShowControlPanel) MusicController(audioManagerInstance),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioManagerInstance.stop();
    super.dispose();
  }
}
