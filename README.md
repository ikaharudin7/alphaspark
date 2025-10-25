# AlphaSpark

A Flutter + Firebase mobile application for Christian Alpha groups, enabling community building and spiritual growth through group discussions and connections.

## Overview

AlphaSpark connects members of Alpha groups, allowing them to:
- Engage with weekly discussion questions
- Participate in group-specific conversations
- Connect with other group members through direct messaging
- Build meaningful relationships within their faith community

## Features

- **Group-Based Authentication**: Users are connected to specific Alpha groups upon account creation
- **Question of the Day**: Weekly discussion prompts for group engagement
- **Group Discussions**: View and participate in discussions with your Alpha group members only
- **Direct Messaging**: Connect one-on-one with other group members
- **Firebase Integration**: Real-time updates and secure data storage

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Auth, Firestore, Cloud Functions, FCM)
- **State Management**: Riverpod
- **Routing**: GoRouter
- **Architecture**: Clean Architecture with Repository Pattern

## Getting Started

### Prerequisites

- Flutter SDK (3.16.0 or later)
- Dart SDK
- Firebase CLI
- Android Studio / Xcode for mobile development

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/alphaspark.git
   cd alphaspark
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:
   - Create a new Firebase project
   - Enable Authentication, Firestore, and Cloud Messaging
   - Download and add configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

4. Run the application:
   ```bash
   flutter run
   ```

## Development Commands

- **Run tests**: `flutter test`
- **Analyze code**: `flutter analyze`
- **Format code**: `dart format .`
- **Build for Android**: `flutter build apk`
- **Build for iOS**: `flutter build ios`

## Project Structure

```
lib/
├── core/                     # Shared utilities and constants
│   ├── constants/           # App constants and Firebase collection names
│   ├── errors/              # Error handling and exceptions
│   ├── theme/               # App theming and styling
│   ├── utils/               # Utility functions and validators
│   └── widgets/             # Reusable UI components
├── features/                # Feature-based modules
│   ├── auth/                # Authentication (login, signup, user management)
│   ├── groups/              # Alpha group management
│   ├── question_of_the_day/ # Weekly discussion questions
│   ├── message_board/       # Group discussions
│   └── connections/         # Direct messaging between users
├── services/                # External service integrations
├── app.dart                 # Root application widget
├── main.dart                # Application entry point
└── routes.dart              # App routing configuration
```

## Firebase Database Structure

```
/users/{userId}              # User profiles and group associations
/groups/{groupId}            # Alpha group information and members
/questions/{questionId}      # Daily/weekly discussion questions
/groupComments/{questionId}_{groupId}/comments/{commentId}  # Group discussions
/groupChats/{groupId}/conversations/{conversationId}/messages/{messageId}  # Direct messages
```

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Make your changes and add tests
4. Ensure all tests pass: `flutter test`
5. Commit your changes: `git commit -m 'Add new feature'`
6. Push to the branch: `git push origin feature/new-feature`
7. Submit a pull request

## Architecture Principles

- **Clean Architecture**: Separation of concerns with distinct layers (presentation, domain, data)
- **Repository Pattern**: Abstract data sources behind repository interfaces
- **Dependency Injection**: Using Riverpod for state management and dependency injection
- **Feature-Based Structure**: Organizing code by features rather than technical layers
- **Testability**: Writing unit, widget, and integration tests for all features

## Security

- **Firebase Security Rules**: Strict rules ensuring users can only access their group's data
- **Authentication**: Firebase Auth with email/password authentication
- **Data Privacy**: Group-isolated data access preventing cross-group data leakage

## Deployment

The application is configured for deployment to:
- **Android**: Google Play Store
- **iOS**: Apple App Store
- **CI/CD**: GitHub Actions for automated testing and building

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.