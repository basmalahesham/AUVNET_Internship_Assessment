import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/firebase_auth_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/repos/auth_repo_impl.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/repos/auth_repo.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/use_cases/register_user_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // Firebase dependencies
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data sources
  getIt.registerLazySingleton<AuthDataSource>(
    () => FirebaseAuthDataSource(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(getIt()),
  );

  // Bloc
  getIt.registerFactory(() => AuthBloc(getIt()));
}
