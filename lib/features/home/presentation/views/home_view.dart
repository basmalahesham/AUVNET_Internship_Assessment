import 'package:auvnet_flutter_internship_assessment/core/utils/service_locator.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/banner_bloc/banner_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/restaurant_bloc/restaurant_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/service_bloc/service_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/user_profile_bloc/user_profile_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BannerBloc>(
              create: (_) => getIt<BannerBloc>()..add(LoadBanners()),
            ),
            BlocProvider<RestaurantBloc>(
              create: (_) => getIt<RestaurantBloc>()..add(LoadRestaurants()),
            ),
            BlocProvider<ServiceBloc>(
              create: (_) => getIt<ServiceBloc>()..add(LoadServices()),
            ),
            BlocProvider<UserProfileBloc>(
              create: (_) => getIt<UserProfileBloc>()
                ..add(LoadUserProfile(FirebaseAuth.instance.currentUser!.uid)),
            ),
          ],
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
