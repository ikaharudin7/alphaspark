import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:alphaspark/features/auth/domain/auth_repository.dart';
import 'package:alphaspark/features/auth/domain/user_entity.dart';
import 'package:alphaspark/features/auth/domain/usecases/sign_in.dart';
import 'package:alphaspark/core/errors/failures.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignIn usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignIn(mockAuthRepository);
  });

  const testEmail = 'test@example.com';
  const testPassword = 'password123';
  final testUser = UserEntity(
    id: '1',
    email: testEmail,
    displayName: 'Test User',
    groupId: 'group1',
    createdAt: DateTime.now(),
    lastLoginAt: DateTime.now(),
  );

  test('should return UserEntity when sign in is successful', () async {
    // arrange
    when(() => mockAuthRepository.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => Right(testUser));

    // act
    final result = await usecase(email: testEmail, password: testPassword);

    // assert
    expect(result, Right(testUser));
    verify(() => mockAuthRepository.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ));
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return AuthFailure when sign in fails', () async {
    // arrange
    when(() => mockAuthRepository.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => const Left(AuthFailure('Invalid credentials')));

    // act
    final result = await usecase(email: testEmail, password: testPassword);

    // assert
    expect(result, const Left(AuthFailure('Invalid credentials')));
    verify(() => mockAuthRepository.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        ));
    verifyNoMoreInteractions(mockAuthRepository);
  });
}