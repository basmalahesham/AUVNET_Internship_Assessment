import 'package:auvnet_flutter_internship_assessment/features/on_boarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesOnboardingBackground),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OnboardingViewBody(),
      ),
    );
  }
}
