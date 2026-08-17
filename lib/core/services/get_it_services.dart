import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/core/services/firebase_auth_services.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Register your services
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),));
}