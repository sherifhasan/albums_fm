# AlbumsFm 

Application used to to search for artists, pick one of their top albums and save it locally.

<img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

Project is built using redux state management

## Folder Structure explanation
The lib folder is divided into three folders. Core, data, shared.

- Core is divided into five folders:
    1. actions: Contains redux actions classes
    2. middlewares: Contains redux middleware layer
    3. reducers: Contains redux reducers layer
        1. main app reducer layer
        2. loading reducer handles app in loading state
        3. search reducer handles load search result in app state
        4. top_albums reducer handles load top albums in app state
        5. album_details reducer handles load album details in app state
    4. models: Contains app state model responsible for holding the Application State
    5. screens: Contains four main screens of the project and widgets folder
        1. main : shows a list of saved albums in database
        2. search : search for artist using artist name
        3. top albums : show a list of artist top albums
        4. details : show main details(albumName, tracks, image) of album
        5. widgets : contains the shared widgets

- data is divided into three folders:
    1. data source : Contains abstract class of Data source and Remote data source(handles data retrieved from internet)
    2. models: Contains api data models response
    3. repositories: Contains app repository handles as if we want in future to extend any app functionality
    4. services: Contains LastFm apis and navigation service

- Shared: Contains files used in whole app utils, screens routes and app images.

### Testing
- unit testing for redux reducers checking the redux actions performed well

## Building ##
- Run `flutter packages get` first to download the dependencies.
- Run `flutter test` to execute tests.
- Run `flutter run` to try it live on running emulator or usb connected device.
- Run `flutter build apk` to generate APK file.
- Run `flutter build ios` to package iOS app.



