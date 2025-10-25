import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository_firebase.dart';
import '../domain/auth_repository.dart';
import '../domain/user_entity.dart';
import '../domain/usecases/sign_in.dart';
import '../domain/usecases/sign_out.dart';
import '../domain/usecases/sign_up.dart';
import 'auth_controller.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryFirebase(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  );
});

final signInUseCaseProvider = Provider<SignIn>((ref) {
  return SignIn(ref.watch(authRepositoryProvider));
});

final signUpUseCaseProvider = Provider<SignUp>((ref) {
  return SignUp(ref.watch(authRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOut>((ref) {
  return SignOut(ref.watch(authRepositoryProvider));
});

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<UserEntity?>>((ref) {
  return AuthController(
    signIn: ref.watch(signInUseCaseProvider),
    signUp: ref.watch(signUpUseCaseProvider),
    signOut: ref.watch(signOutUseCaseProvider),
  );
});

final authStateProvider = StreamProvider<UserEntity?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.watchAuthState().map((either) {
    return either.fold(
      (failure) => throw Exception(failure.toString()),
      (user) => user,
    );
  });
});

final currentUserProvider = FutureProvider<UserEntity?>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  final result = await authRepository.getCurrentUser();
  return result.fold(
    (failure) => throw Exception(failure.toString()),
    (user) => user,
  );
});