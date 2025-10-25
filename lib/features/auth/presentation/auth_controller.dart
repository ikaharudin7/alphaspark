import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_entity.dart';
import '../domain/usecases/sign_in.dart';
import '../domain/usecases/sign_out.dart';
import '../domain/usecases/sign_up.dart';
import 'auth_providers.dart';

class AuthController extends StateNotifier<AsyncValue<UserEntity?>> {
  final SignIn _signIn;
  final SignUp _signUp;
  final SignOut _signOut;

  AuthController({
    required SignIn signIn,
    required SignUp signUp,
    required SignOut signOut,
  })  : _signIn = signIn,
        _signUp = signUp,
        _signOut = signOut,
        super(const AsyncValue.data(null));

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final result = await _signIn(email: email, password: password);

    result.fold(
      (failure) => state = AsyncValue.error(failure.toString(), StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
    required String groupId,
  }) async {
    state = const AsyncValue.loading();

    final result = await _signUp(
      email: email,
      password: password,
      displayName: displayName,
      groupId: groupId,
    );

    result.fold(
      (failure) => state = AsyncValue.error(failure.toString(), StackTrace.current),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    final result = await _signOut();

    result.fold(
      (failure) => state = AsyncValue.error(failure.toString(), StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }
}