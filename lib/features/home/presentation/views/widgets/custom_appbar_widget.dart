import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 156.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8900FE), Color(0xFFFFDE59)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivering to', style: TextStyles.dmSans12Bold),
                4.height,
                Text('Al Satwa, 81A Street', style: TextStyles.dmSans16Bold),
                7.height,
                Text('Hi hepa! ', style: TextStyles.rubik30Bold),
              ],
            ),
            Image.asset(Assets.imagesUser),
          ],
        ),
      ),
    );
  }
}
