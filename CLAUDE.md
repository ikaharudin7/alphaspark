# CLAUDE.md

# Project Context
We are building a **Flutter + Firebase** mobile app (iOS & Android) for a Christian community platform. 
Users can:
- Each person when creating account will be connected to an Alpha Group already. They can only interact and view posts from people from the same Alpha group. 
- Log in (Firebase Auth)
- Users will first see a system generated question (e.g. question of the week which is global) which is posted to a discussion board.
- You can only view discussion comments from your own Alpha group members. All comments you make are also only viewed by Alpha group members. 
- From a comment made by someone else, you can click on their profile and continue the discussion in a one on one in a direct message functionality between users in the same alpha group. The person who is messaged needs to be able to accept that invite to connect. 
- Send intentional messages to connect with others

We want to develop using localhost, but please set it up so that it can be deployed as a firebase app on ANDROID AND IOS. 

We want a **clean, scalable architecture**, following modern Flutter best practices.

## Development Commands

*To be added once package.json or build system is established*

## Architecture Overview
---

# Architecture Principles
- **Clean Architecture**: Separate presentation, domain, and data layers.
- **Dependency Injection (DI)** using `get_it` or `riverpod`.
- **State Management**: Use `Riverpod` for scalability and simplicity.
- **Feature-based foldering** rather than monolithic structure.
- **Firebase Integration**: Firestore for data, Auth for users, Cloud Functions for logic, FCM for notifications.
- **Repository Pattern**: Abstract Firebase behind repositories to enable swapping implementations later.
- **CI/CD** handled via GitHub Actions.
- **App should be testable** with unit, widget, and integration tests.

---
## Repository Status

This is currently an empty repository with no codebase. The following sections will need to be updated once code is added to the repository.


### Folder / Repo Structure

alphaspark/
├── lib/
│ ├── core/
│ │ ├── constants/
│ │ ├── errors/
│ │ ├── utils/
│ │ ├── theme/
│ │ └── widgets/ # Shared widgets
│ │
│ ├── features/
│ │ ├── auth/
│ │ │ ├── data/ # FirebaseAuth repo, models
│ │ │ ├── domain/ # Entities, use cases
│ │ │ ├── presentation/ # Screens, widgets, providers
│ │ │ └── auth_providers.dart
│ │ │
│ │ ├── question_of_the_day/
│ │ │ ├── data/ # Firestore access
│ │ │ ├── domain/ # Entities, interfaces
│ │ │ └── presentation/ # UI & state providers
│ │ │
│ │ ├── message_board/
│ │ │ ├── data/
│ │ │ ├── domain/
│ │ │ └── presentation/
│ │ │
│ │ ├── connections/
│ │ │ ├── data/
│ │ │ ├── domain/
│ │ │ └── presentation/
│ │ │
│ │ └── groups/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ │
│ ├── services/
│ │ ├── firebase_service.dart
│ │ ├── notification_service.dart
│ │ ├── analytics_service.dart
│ │ └── location_service.dart
│ │
│ ├── app.dart # Root app widget, router setup
│ ├── main.dart # Entry point
│ └── routes.dart # App route definitions
│
├── test/
│ ├── unit/
│ ├── widget/
│ └── integration/
│
├── android/
├── ios/
├── pubspec.yaml
├── firebase.json
├── firestore.rules
├── .github/
│ └── workflows/
│ └── flutter-firebase.yml
└── README.md

# Guidelines for Implementation

### 🧩 1. Core Layer
- Holds cross-cutting utilities (themes, constants, shared widgets, logging, error handling).
- Avoid direct Firebase references here.

### ⚙️ 2. Data Layer (inside each feature)
- Responsible for interacting with Firebase (Firestore, Auth, Cloud Functions).
- Implement repository interfaces defined in the `domain` layer.
- Example: `AuthRepositoryFirebase implements AuthRepository`.

### 🧠 3. Domain Layer
- Contains **entities**, **value objects**, and **use cases** (business logic).
- No dependency on Flutter or Firebase.

### 🎨 4. Presentation Layer
- Widgets, screens, and state providers.
- Uses Riverpod to manage UI state and call domain-layer use cases.


# Example Data Flow

UI (Widget)
↓
State Provider (Riverpod)
↓
Use Case (Domain Layer)
↓
Repository Interface
↓
Firebase Repository Implementation
↓
Firestore / Auth / Functions
---

# Example: Auth Feature Structure

features/auth/
├── data/
│ ├── auth_repository_firebase.dart
│ └── user_model.dart
├── domain/
│ ├── auth_repository.dart
│ ├── user_entity.dart
│ └── usecases/
│ ├── sign_in.dart
│ ├── sign_out.dart
│ └── register_user.dart
└── presentation/
├── login_screen.dart
├── signup_screen.dart
├── auth_controller.dart
└── auth_providers.dart

# High Level Database Design
/users/{userId}
/groups/{groupId}
/questions/{questionId}
/groupComments/{questionId}_{groupId}/comments/{commentId}
/groupChats/{groupId}/conversations/{conversationId}/messages/{messageId}

# Tooling & Packages

| Purpose | Package |
|----------|----------|
| State Management | `flutter_riverpod` |
| Routing | `go_router` |
| Firebase Integration | `firebase_core`, `cloud_firestore`, `firebase_auth`, `firebase_messaging`, `firebase_analytics` |
| Dependency Injection | `get_it` or use Riverpod providers |
| Forms & Validation | `flutter_form_builder` |
| Theming | `flex_color_scheme` |
| Testing | `flutter_test`, `mocktail`, `integration_test` |

---

# Scalability Considerations
- Use repository interfaces for testability and future backend migration.
- Keep Firestore access in data layer only.
- Use Cloud Functions for heavy logic (e.g., matching users, daily question updates).
- Add error logging and analytics early.
- Write integration tests for core user flows.

---

# Deliverable for Claude
When asked to generate or modify code:
- Maintain the above architecture.
- Follow feature-based folder structure.
- Use Riverpod providers for state.
- Follow repository pattern.
- Ensure null safety, testability, and clean separation of concerns.



## Important Notes for Future Development

- This repository is named "alphaspark" - consider this when planning the project structure and naming conventions
- Update this CLAUDE.md file with specific commands, architecture details, and development guidelines as the codebase grows
- Include build, test, lint, and deployment commands when they become available
- Document any specific architectural patterns or conventions adopted by the project