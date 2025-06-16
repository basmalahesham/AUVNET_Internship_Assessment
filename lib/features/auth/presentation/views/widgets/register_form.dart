import 'package:auvnet_flutter_internship_assessment/core/helper/extensions.dart';
import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/helper/validations.dart';
import 'package:auvnet_flutter_internship_assessment/core/routing/routes.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_internship_assessment/core/widgets/custom_text_form_field.dart';
import 'package:auvnet_flutter_internship_assessment/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmationPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextFormField(
              controller: emailController,
              hintText: 'mail',
              validator: (value) {
                return emailValidator(value, context);
              },
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.black.withValues(alpha: 0.30),
                ),
              ),
            ),
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextFormField(
              controller: passwordController,
              hintText: 'password',
              validator: (value) {
                return passwordValidator(value, context);
              },
              isObscureText: isPasswordObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() => isPasswordObscure = !isPasswordObscure);
                },
                icon: Icon(
                  isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManager.kPrimaryColor,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.black.withValues(alpha: 0.30),
                ),
              ),
            ),
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomTextFormField(
              controller: confirmPasswordController,
              hintText: 'confirm password',
              validator: (value) {
                return confirmPasswordValidator(
                  value,
                  passwordController.text,
                  context,
                );
              },
              isObscureText: isConfirmationPasswordObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(
                    () => isConfirmationPasswordObscure =
                        !isConfirmationPasswordObscure,
                  );
                },
                icon: Icon(
                  isConfirmationPasswordObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: ColorsManager.kPrimaryColor,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.black.withValues(alpha: 0.30),
                ),
              ),
            ),
          ),
          15.height,
          CustomElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                  RegisterRequested(
                    email: emailController.text.trim(),
                    password: passwordController.text,
                  ),
                );
              }
            },
            minimumSize: Size(double.infinity, 45.h),
            text: "Register",
            style: TextStyles.dmSans14Medium,
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.loginView);
            },
            child: Text(
              "Already have an account",
              style: TextStyles.dmSans14Bold,
            ),
          ),
          10.height,
        ],
      ),
    );
  }
}
