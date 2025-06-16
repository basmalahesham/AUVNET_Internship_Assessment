import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (_) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          Assets.imagesPhoto,
          fit: BoxFit.cover,
          width: 375.w,
          height: 200.h,
        ),
      );
    });

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 2.0,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: items.map((item) {
            return SizedBox(
              width: 375.w,
              height: 200.h,
              child: item,
            );
          }).toList(),
        ),
        4.height,
        DotsIndicator(
          dotsCount: items.length,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: ColorsManager.kPrimaryColor,
            color: Color(0xFFD9D9D9),
            size: Size(8.w, 8.h),
            activeSize: Size(8.w, 8.h),
            spacing: EdgeInsets.symmetric(horizontal: 5.w), // قلل المسافة الأفقية هنا

          ),
        ),
      ],
    );
  }
}
