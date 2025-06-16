import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/login_view.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/register_view.dart';
import 'package:auvnet_flutter_internship_assessment/features/home_layout/presentation/views/home_layout.dart';
import 'package:auvnet_flutter_internship_assessment/features/on_boarding/presentation/views/onboarding_view.dart';
import 'package:auvnet_flutter_internship_assessment/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
