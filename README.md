# A.I.D. (Am I in Danger?)
## Synopsis
AID is a LifeLines '25 Hackathon project which intends to provide assistment in civillian coordination and displacement. The app will provide a cached map of a given territory and provide valuable data like damage assesments, an SOS button to alert and contact your emergency contact entries and a dedicated page for local news regarding airstrike warnings, evacuation and more information.

## Setup

Dependencies:
- Flutter SDK >= 3.6.1
- Android SDK
  - Platform Tools >= 35.0.0
  - Build Tools >= 36.0.0
  - Command Line Tools >= 17.0.0
  - Emulator >= 35.3.0 (optional, see [USB Debugging Options](https://developer.android.com/studio/debug/dev-options))

1. Clone the repo
```sh
git clone https://github.com/abilkhairseilov/lifelines-25 lifelines_25
```
NOTE: it is important that you leave the folder name with an underscore, as a dash conflicts with Flutter's package naming rules.

2. Fetch dependencies
```sh
cd lifelines_25
flutter pub get
```

3. Run the app
```sh
flutter run -v
```

-----

## Credits

Credits go to:
- Flutter, for providing information and code snippets for widgets within the app through a neat documentation interface.
- Google, for Google Maps
- My buddy Chat Gippity, for providing a snippet solution for a problem i've faced for days
