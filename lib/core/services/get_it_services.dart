import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/core/services/database_service.dart';
import 'package:food_delivery_app/core/services/firebase_auth_services.dart';
import 'package:food_delivery_app/core/services/firestore_service.dart';
import 'package:food_delivery_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/location/presentation/cubit/location_cubit.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // Register your services
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
    databaseService: getIt<DatabaseService>(),
  ));
  getIt.registerLazySingleton<LocationService>(
        () => LocationService(),
  );

  getIt.registerFactory<LocationCubit>(
        () => LocationCubit(getIt<LocationService>()),
  );
}