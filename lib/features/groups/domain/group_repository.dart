import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import 'group_entity.dart';

abstract class GroupRepository {
  Future<Either<Failure, GroupEntity>> getGroupById(String groupId);
  Future<Either<Failure, List<GroupEntity>>> getUserGroups(String userId);
  Future<Either<Failure, GroupEntity>> createGroup({
    required String name,
    required String description,
    required String adminId,
  });
  Future<Either<Failure, void>> updateGroup(GroupEntity group);
  Future<Either<Failure, void>> addMemberToGroup({
    required String groupId,
    required String userId,
  });
  Future<Either<Failure, void>> removeMemberFromGroup({
    required String groupId,
    required String userId,
  });
  Future<Either<Failure, void>> deleteGroup(String groupId);
  Stream<Either<Failure, GroupEntity>> watchGroup(String groupId);
}