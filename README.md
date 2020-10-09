# flutter_itunes_player
A flutter app which allows users to search for music using by artist name. It shows information about the song as well as a thumbnail. The app can play a 30 seconds preview on selected songs.

![](app-preview.gif)

## Features implemented
- Search and list songs by artist name.
- Displays song’s title, artist, album and album art.
- Play preview of 30 seconds
- Indicator when a song is being played.
- Indicator removal when a song finishes playing.
- Pause and resume control.
- Continues to play the current song when a new search is performed.
- Play/pause control is only shown when a song is clicked.
- returns up to 50 songs.
 
## Installation
Clone this repo.
install dependencies 

```
flutter pub get.
```
Run the app. (make sure you have Android simulator open at this point)

```
flutter run
```

## How to run test
```
flutter test
```

## System requirement
The app was developed using Flutter Channel stable version 1.22.0. It should support Android devices with SDK version from 23 to 29. I have only tested the app using Android simulator but it should work on iOS too.

## Time spent
6 hours

## Improvements
Due to time constraint, I didn't have as many tests as I like to have. Here is a list of things I would improve/test if I had more time.

- Implement state management solution (BLoC or Provider) to separate business logic from UI.
- Spend more time comparing different audio player plugins, and find the most suitable one.
- Test Song model conversion from raw JSON input.
- Test music player's different UI states when different song data is provided.
	- eg. Mock `songs` data with two songs in it, and make sure expected information are there.
	- Mock the API call with various status code returned (200, 202, 400, 404....), and make sure the app handles errors correctly.
	- Break search bar and songs list into two different files, similar to what I did to `MusicController`.
