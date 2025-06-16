import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopularRestaurantsNearbyItemWidgets extends StatelessWidget {
  const CustomPopularRestaurantsNearbyItemWidgets({
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
          width: 80.w,
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Image.asset(imagePath),
        ),
        8.height,
        Text(
          text,
          style: TextStyles.dmSans12Medium.copyWith(color: Colors.black),
        ),
        4.height,
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 10,
              color: Color(0xFF1E1E1E).withValues(alpha: .58),
            ),
            2.width,
            Text(
              text2,
              style: TextStyles.dmSans10Medium.copyWith(
                color: Color(0xFF1E1E1E).withValues(alpha: .58),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
