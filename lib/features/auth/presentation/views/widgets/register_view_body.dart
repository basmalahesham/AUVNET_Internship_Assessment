import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/register_bloc_listener.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/register_form.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesNawel),
                    const SizedBox(height: 24),
                     RegisterForm(),
                    const SizedBox(height: 16),
                    const RegisterBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
