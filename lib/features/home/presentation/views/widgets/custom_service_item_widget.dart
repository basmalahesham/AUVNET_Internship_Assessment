import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServiceItemWidget extends StatelessWidget {
  const CustomServiceItemWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.text2,
  });
  final String imagePath;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          width: 105.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(imagePath),
        ),
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsManager.kPrimaryColor,
          ),
          child: Text(text, style: TextStyles.dmSans12Medium),
        ),
        Text(
          text2,
          style: TextStyles.dmSans14Medium.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
