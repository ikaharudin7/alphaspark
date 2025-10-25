import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../auth_repository.dart';
import '../user_entity.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}