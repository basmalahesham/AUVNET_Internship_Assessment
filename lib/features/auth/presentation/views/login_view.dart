import 'package:auvnet_flutter_internship_assessment/core/utils/service_locator.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: LoginViewBody(),
    ));
  }
}
