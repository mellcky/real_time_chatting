# Real-Time Chat Application

A feature-rich, real-time chat application built with Flutter and Firebase. This application supports text messaging, media sharing, and real-time updates.

## Features

- **Authentication**
  - Email/password login and registration
  - Google Sign-In
  - Password recovery

- **Real-time Messaging**
  - One-on-one and group chats
  - Real-time message delivery
  - Typing indicators
  - Read receipts
  - Message status (sent, delivered, read)

- **Rich Media Support**
  - Text messages
  - Image sharing (camera and gallery)
  - Video sharing
  - Audio messages
  - File attachments
  - Location sharing

- **User Experience**
  - Dark and light theme
  - Offline support
  - Message search
  - User profile customization
  - Push notifications

## Technologies Used

- **Flutter & Dart** - UI framework
- **Firebase**
  - Authentication - User management
  - Firestore - Database for messages and user data
  - Storage - Media file storage
  - Messaging - Push notifications
- **Riverpod** - State management
- **Various Flutter packages** - Media handling, UI components, etc.

## Project Structure

The project follows a clean architecture approach with the following structure:

```
lib/
├── presentation/         # UI layer
│   ├── screens/          # App screens
│   ├── widgets/          # Reusable UI components
│   └── theme/            # App theme and styling
├── application/          # Business logic layer
│   ├── providers/        # Riverpod providers
│   └── services/         # Business logic services
├── domain/               # Domain layer
│   ├── models/           # Data models
│   └── repositories/     # Repository interfaces
├── infrastructure/       # Implementation layer
│   ├── repositories/     # Repository implementations
│   ├── services/         # External service implementations
│   └── datasources/      # Data sources
└── core/                 # Shared utilities
    ├── utils/            # Utility functions
    └── constants/        # App constants
```

## Setup Instructions

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Firebase account
- Android Studio / VS Code

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/real_time_chatting.git
   cd real_time_chatting
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Firebase Setup:
   - Create a new Firebase project
   - Enable Authentication (Email/Password and Google Sign-In)
   - Create Firestore database
   - Set up Firebase Storage
   - Configure Firebase for your platforms (Android/iOS)
   - Download and add the configuration files to your project

4. Run the application:
   ```
   flutter run
   ```

## Usage

1. Launch the app and create an account or sign in
2. Navigate through the bottom tabs to access chats, contacts, and profile
3. Start a new chat by tapping the floating action button
4. Send messages, images, and other media in the chat screen
5. Customize your profile and settings in the profile tab

## Testing

### Automated Testing
To run the automated tests:

```
flutter test
```

### Manual Testing
A comprehensive manual test plan is available in `test/manual_test_plan.md`. This document outlines procedures for:
- Build verification
- Functional testing (authentication, messaging, user experience)
- Performance testing
- Security testing
- Regression testing

### Build Verification
To verify the application builds correctly:

```
dart test/build_verification.dart
```

This script will run Flutter analyze and attempt to build the application for Android to ensure there are no critical errors.

## Future Enhancements

- End-to-end encryption
- Message reactions
- Message editing and deletion
- Voice and video calls
- Group chat management
- Message translation
- Custom themes
- Web and desktop support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
