# UMBC Lost & Found Mobile App

A Flutter mobile application for the UMBC Lost & Found platform.

## Project Structure

```
lib/
  ├── models/         # Data models
  ├── views/          # Screen UI
  ├── widgets/        # Reusable UI components
  ├── services/       # API and Firebase services
  ├── utils/          # Helper functions and constants
  ├── providers/      # State management
  └── main.dart       # App entry point
```

## Features

- Material Design 3 with UMBC theme colors
- Firebase Authentication
- Cloud Firestore database
- Image upload and storage
- Location services with Google Maps
- Push notifications
- Responsive UI for both iOS and Android

## Getting Started

1. Install Flutter:
   ```bash
   brew install --cask flutter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Development

- Use `flutter create` to add platform support
- Use `flutter pub add` to add new dependencies
- Use `flutter build` to create release builds

## Firebase Setup

1. Create a new Firebase project
2. Add Android and iOS apps
3. Download and add configuration files
4. Enable Authentication and Firestore

## Contributing

1. Create a new branch
2. Make changes
3. Test thoroughly
4. Submit a pull request

## Theme

The app uses UMBC's official colors:
- Primary: Gold (#FFD700)
- Secondary: Black (#000000)
