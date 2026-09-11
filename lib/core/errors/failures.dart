import 'package:firebase_auth/firebase_auth.dart';

abstract class Failures {
  final String message;

  Failures({required this.message});
}

class ServerFailure extends Failures{
  ServerFailure({required super.message});
}

class AccountLinkingFailure extends Failures {
  final String email;
  final OAuthCredential pendingCredential;

  AccountLinkingFailure({
    required this.email,
    required this.pendingCredential,
  }) : super(message: 'This email is already registered with another sign-in method.');
}