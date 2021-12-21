# pinto_admin_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setting up

to get project plugin and dependency run
```
flutter pub get
```
to make application connect to backend service go to
```
./lib/api/api.dart
```
then, set the value of baseUrl to your current url of backend service

## Build app apk for android
- Create an upload keystore follow this [doc](https://docs.flutter.dev/deployment/android#create-an-upload-keystore)

- then store your keystore in private directory

- Edit key.properties file follow this [doc](https://docs.flutter.dev/deployment/android#reference-the-keystore-from-the-app)

- run command in project directory
```
flutter build apk
```

- apk file should store in directory
```
build\app\outputs\flutter-apk\app-release.apk
```