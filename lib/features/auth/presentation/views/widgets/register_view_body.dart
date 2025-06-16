import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/register_bloc_listener.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/register_form.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Assets.imagesNawel),
            RegisterForm(),
            const RegisterBlocListener(),
          ],
        ),
      ),
    );
  }
}
