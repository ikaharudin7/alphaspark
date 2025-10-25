import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String id;
  final String question;
  final String description;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final bool isActive;
  final String createdBy;

  const QuestionEntity({
    required this.id,
    required this.question,
    required this.description,
    required this.createdAt,
    this.expiresAt,
    this.isActive = true,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        description,
        createdAt,
        expiresAt,
        isActive,
        createdBy,
      ];
}