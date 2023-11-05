# Bloc Architecture Flutter App

 Bloc Architecture App is a Flutter application that demonstrates how to use the BLoC (Business Logic Component) pattern to fetch and display COVID-19 summary data from the [COVID-19 API](https://api.covid19api.com/summary).

## Features

- Fetch COVID-19 summary data from the [COVID-19 API](https://api.covid19api.com/summary).
- Display global and country-specific COVID-19 data.

## Getting Started

To get started with the Bloc app, follow these steps:

1. Clone this repository:

   ```
   git clone https://github.com/Njuguna-JohnBrian/Bloc-Architecture-Flutter-App.git
   ```

2. Open the project in your favorite Flutter IDE.

3. Ensure that you have Flutter and Dart installed. If not, follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).

4. Install the project dependencies by running the following command in the project directory:

   ```
   flutter pub get
   ```

5. Run the app on an emulator or physical device:

   ```
   flutter run
   ```

## Dependencies

The app uses the following dependencies:

- [flutter](https://flutter.dev): The Flutter framework.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Icon assets for the app.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Provides the BLoC architecture.
- [equatable](https://pub.dev/packages/equatable): Helps with value equality comparisons.
- [dio](https://pub.dev/packages/dio): A powerful HTTP client for making API requests.

## Project Structure

The project is structured as follows:

- `lib`: Contains the main Flutter code.
  - `bloc`: Contains BLoC-related code.
  - `data`: Handles data fetching and parsing.
  - `models`: Defines data models.
  - `screens`: Contains the app's user interface.
  - `main.dart`: The entry point of the application.

## Configuration

The `pubspec.yaml` file contains the project configuration, including the dependencies used in the project.

```yaml
pubspec:
  name: bloc_weather
  description: A new Flutter project.
  version: 1.0.0+1
  environment:
    sdk: '>=2.18.4 <3.0.0'
  dependencies:
    flutter:
      sdk: flutter
    cupertino_icons: ^1.0.2
    flutter_bloc: ^8.1.1
    equatable: ^2.0.3
    dio: ^4.0.4
  dev_dependencies:
    flutter_test:
      sdk: flutter
    flutter_lints: ^2.0.0
  flutter:
    uses-material-design: true
```

## Additional Notes

- This app serves as a sample project to illustrate the usage of BLoC architecture with Flutter.

Feel free to customize and expand upon this project to meet your specific needs. Enjoy building with Flutter and the BLoC pattern!