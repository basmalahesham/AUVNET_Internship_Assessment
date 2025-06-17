import 'package:auvnet_flutter_internship_assessment/core/utils/constants.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/models/user_model.dart';
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

import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/banner_bloc/banner_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/restaurant_bloc/restaurant_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/service_bloc/service_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/user_profile_bloc/user_profile_bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  final userBox = Hive.box<UserModel>(kUserBox);

  // Firebase
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => FirebaseAuthDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => HiveAuthLocalDataSource(userBox),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(getIt()),
  );
  getIt.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(getIt()),
  );
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt(), getIt()));

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => FirebaseHomeDataSource(getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<GetBannersUseCase>(
    () => GetBannersUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetServicesUseCase>(
    () => GetServicesUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetRestaurantsUseCase>(
    () => GetRestaurantsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(getIt()),
  );

  // Blocs
  getIt.registerFactory<BannerBloc>(() => BannerBloc(getIt()));
  getIt.registerFactory<RestaurantBloc>(() => RestaurantBloc(getIt()));
  getIt.registerFactory<ServiceBloc>(() => ServiceBloc(getIt()));
  getIt.registerFactory<UserProfileBloc>(() => UserProfileBloc(getIt()));
}
