import 'package:auvnet_flutter_internship_assessment/core/helper/extensions.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/custom_loading_indicator.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/snackbar_service.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatefulWidget {
  const RegisterBlocListener({super.key});

  @override
  State<RegisterBlocListener> createState() => _RegisterBlocListenerState();
}

class _RegisterBlocListenerState extends State<RegisterBlocListener> {
  //UserModel? user;

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
          Navigator.pop(context); // Dismiss loading
          //log(user.toString());
          SnackBarService.showSuccessMessage(
            context,
            'Congratulations, you have signed up successfully!',
          );
          context.pushReplacementNamed(Routes.homeLayout);
        } else if (state is AuthFailure) {
          Navigator.pop(context); // Dismiss loading
          SnackBarService.showErrorMessage(state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
