import 'package:auvnet_flutter_internship_assessment/core/helper/extensions.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/custom_loading_indicator.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/snackbar_service.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CustomLoadingIndicator()),
          );
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          SnackBarService.showSuccessMessage(
            context,
            'Congratulations, you have logged In successfully!',
          );
          context.pushReplacementNamed(Routes.homeLayout);
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          SnackBarService.showErrorMessage(state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
