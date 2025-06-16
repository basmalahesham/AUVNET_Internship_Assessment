import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/login_form.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(Assets.imagesNawel), LoginForm()],
      ),
    );
  }
}
