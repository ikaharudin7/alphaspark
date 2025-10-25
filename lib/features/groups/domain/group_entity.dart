import 'package:equatable/equatable.dart';

class GroupEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> members;
  final List<String> admins;
  final DateTime createdAt;
  final bool isActive;
  final int maxMembers;

  const GroupEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.admins,
    required this.createdAt,
    this.isActive = true,
    this.maxMembers = 20,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        members,
        admins,
        createdAt,
        isActive,
        maxMembers,
      ];
}