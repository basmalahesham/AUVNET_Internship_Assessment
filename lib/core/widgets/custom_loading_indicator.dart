import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.kPrimaryColor,
      ),
    );
  }
}
