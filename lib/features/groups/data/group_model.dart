import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/group_entity.dart';

class GroupModel extends GroupEntity {
  const GroupModel({
    required super.id,
    required super.name,
    required super.description,
    required super.members,
    required super.admins,
    required super.createdAt,
    super.isActive,
    super.maxMembers,
  });

  factory GroupModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return GroupModel(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      members: List<String>.from(data['members'] ?? []),
      admins: List<String>.from(data['admins'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      isActive: data['isActive'] ?? true,
      maxMembers: data['maxMembers'] ?? 20,
    );
  }

  factory GroupModel.fromEntity(GroupEntity entity) {
    return GroupModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      members: entity.members,
      admins: entity.admins,
      createdAt: entity.createdAt,
      isActive: entity.isActive,
      maxMembers: entity.maxMembers,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'members': members,
      'admins': admins,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActive': isActive,
      'maxMembers': maxMembers,
    };
  }

  GroupModel copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? members,
    List<String>? admins,
    DateTime? createdAt,
    bool? isActive,
    int? maxMembers,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      members: members ?? this.members,
      admins: admins ?? this.admins,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      maxMembers: maxMembers ?? this.maxMembers,
    );
  }
}