import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../auth_repository.dart';
import '../user_entity.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String displayName,
    required String groupId,
  }) async {
    return await repository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
      groupId: groupId,
    );
  }
}