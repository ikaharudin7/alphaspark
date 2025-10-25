import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String displayName;
  final String? profileImageUrl;
  final String groupId;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.email,
    required this.displayName,
    this.profileImageUrl,
    required this.groupId,
    required this.createdAt,
    required this.lastLoginAt,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        displayName,
        profileImageUrl,
        groupId,
        createdAt,
        lastLoginAt,
        isActive,
      ];
}