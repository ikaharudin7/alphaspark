class AppConstants {
  static const String appName = 'AlphaSpark';
  static const String appVersion = '1.0.0';

  static const int maxMessageLength = 500;
  static const int maxGroupSize = 20;
  static const int maxUsernameLength = 30;

  static const Duration sessionTimeout = Duration(hours: 24);
  static const Duration messageTimeout = Duration(seconds: 30);

  static const String defaultProfileImageUrl = 'assets/images/default_profile.png';
  static const String appLogoUrl = 'assets/images/app_logo.png';
}

class FirebaseConstants {
  static const String usersCollection = 'users';
  static const String groupsCollection = 'groups';
  static const String questionsCollection = 'questions';
  static const String groupCommentsCollection = 'groupComments';
  static const String groupChatsCollection = 'groupChats';
  static const String conversationsCollection = 'conversations';
  static const String messagesCollection = 'messages';
}

class RouteConstants {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String questionOfTheDay = '/question-of-the-day';
  static const String messageBoard = '/message-board';
  static const String directMessage = '/direct-message';
  static const String settings = '/settings';
}