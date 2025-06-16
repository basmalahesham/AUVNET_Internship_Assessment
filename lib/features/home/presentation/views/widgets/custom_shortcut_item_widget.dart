import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShortcutItemWidget extends StatelessWidget {
  const CustomShortcutItemWidget({
    super.key,
    required this.imagePath,
    required this.text,
  });
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65.w,
          height: 65.h,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFEEE6),
          ),
          child: Image.asset(imagePath),
        ),
        8.height,
        Text(
          text,
          style: TextStyles.dmSans12Medium.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
