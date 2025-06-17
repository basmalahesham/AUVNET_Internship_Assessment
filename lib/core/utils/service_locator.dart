import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/firebase_auth_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/repos/auth_repo_impl.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/repos/auth_repo.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/use_cases/login_user_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/domain/use_cases/register_user_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/data/repos/home_repository_impl.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/repos/home_repository.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_banners_use_case.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_restaurants_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_user_profile_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/home_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // Firebase dependencies
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  // Firebase Firestore
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

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

  getIt.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(getIt()),
  );

  // Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<RegisterUserUseCase>(), getIt<LoginUserUseCase>()),
  );

  // Home Remote Data Source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => FirebaseHomeDataSource(getIt<FirebaseFirestore>()),
  );

  // Home Repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()),
  );

  // Home UseCases
  getIt.registerLazySingleton<GetBannersUseCase>(
    () => GetBannersUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetServicesUseCase>(
    () => GetServicesUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetRestaurantUseCase>(
    () => GetRestaurantUseCase(getIt<HomeRepository>()),
  );
  getIt.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(getIt<HomeRepository>()),
  );

  // Home Bloc
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      getIt<GetBannersUseCase>(),
      getIt<GetServicesUseCase>(),
      getIt<GetRestaurantUseCase>(),
      getIt<GetUserProfileUseCase>(),
    ),
  );
}
