import 'package:auvnet_flutter_internship_assessment/core/helper/extensions.dart';
import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_internship_assessment/features/on_boarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goToNextPage() {
    if (_currentIndex < onboardingPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _getStarted() {
    context.pushReplacementNamed(Routes.loginView);
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: onboardingPages.length,
      onPageChanged: (index) {
        setState(() => _currentIndex = index);
      },
      itemBuilder: (context, index) {
        final page = onboardingPages[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                page.title,
                textAlign: TextAlign.center,
                style: TextStyles.rubik24Medium,
              ),
              11.height,
              Text(
                page.subtitle,
                textAlign: TextAlign.center,
                style: TextStyles.rubik14Regular,
              ),
              52.height,
              CustomElevatedButton(
                onPressed: _getStarted,
                minimumSize: Size(double.infinity, 44.h),
                text: "Get Started",
                style: TextStyles.rubik18Medium,
              ),
              14.height,
              TextButton(
                onPressed: _goToNextPage,
                child: Text(
                  "next",
                  style: TextStyles.rubik14Regular,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
