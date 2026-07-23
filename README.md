# Flutter News App

A cross-platform Flutter application for browsing news with Firebase-backed
phone authentication and a mobile-first interface.

## Technology

- Flutter and Dart
- Firebase Core, Authentication, Firestore, and Storage
- Provider for application state
- HTTP for remote content
- Shared Preferences for local persistence

## Run locally

```bash
git clone https://github.com/CHAITANYA2605/newsapp_flutter.git
cd newsapp_flutter
flutter pub get
flutter run
```

## Configuration

1. Create or select a Firebase project.
2. Register the platforms you plan to run.
3. Generate Firebase configuration with FlutterFire.
4. Enable phone authentication and any Firebase products used by the app.
5. Configure the news-data endpoint or API key expected by the source.

Restrict client API keys to the intended apps and APIs. Do not commit server
credentials.

## Quality checks

```bash
flutter analyze
flutter test
```

## Platforms

The repository includes Flutter runners for Android, iOS, web, macOS, Linux,
and Windows. Firebase and plugin capabilities can differ by target.

## License

See [LICENSE](LICENSE).
