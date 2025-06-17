import 'package:auvnet_flutter_internship_assessment/core/helper/extensions.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/utils/service_locator.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    decideNavigationBasedOnUser();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) => SlideTransition(
          position: slidingAnimation,
          child: Image.asset(Assets.imagesNawel),
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void decideNavigationBasedOnUser() async {
    await Future.delayed(const Duration(seconds: 2));

    final authLocal = getIt<AuthLocalDataSource>();
    final cachedUser = await authLocal.getCachedUser();

    if (cachedUser != null) {
      context.pushReplacementNamed(Routes.homeLayout);
    } else {
      context.pushReplacementNamed(Routes.onBoardingView);
    }
  }
}
