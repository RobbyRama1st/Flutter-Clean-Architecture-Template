This is a boilerplate Flutter app that follows the Clean Architecture pattern with BLoC and dependency injection.

## Features

- Clean Architecture: Separation of concerns with clear boundaries between the data, domain, and presentation layers.
- BLoC Pattern: Business Logic Component pattern for managing state and handling interactions between UI and data.
- Dependency Injection: Uses the `get_it` package for dependency injection to manage dependencies throughout the app.

## Folder Structure

The app follows the following folder structure:

- `lib`: Contains the main source code of the app.
  - `app`: Contain the main app like routes, and main widget.
  - `data`: Contains the data layer components, such as models, repositories, datasources.
  - `di`: Contains the dependency injection
  - `domain`: Contains the domain layer components, such as entities, use cases, and repositories.
  - `presentation`: Contains the presentation layer components, such as BLoCs, pages, and widgets.
  - `utils`: Contains utility classes or helper functions used across the app.

## Getting Started

To run the app locally, follow these steps:

### Prerequisites

- Flutter SDK installed on your machine. You can download it from the official Flutter website: https://flutter.dev/docs/get-started/install

### Steps

1. Clone this repository to your local machine using a git client or by downloading the ZIP file.
2. Open a terminal and navigate to the root folder of the cloned repository.
3. Run `flutter pub get` to install the dependencies listed in the `pubspec.yaml` file.
4. Connect your device or start an emulator.
5. Run `flutter run` to build and run the app on your device/emulator.

Note: Make sure you have a valid Flutter SDK and Dart SDK installed and configured on your machine.

## Testing

The app includes unit and integration tests. You can run the tests using the following command:

`flutter test`

This will run all the tests in the `test` folder and show the test results in the terminal.

## License

This project is available under the [MIT License](LICENSE).
