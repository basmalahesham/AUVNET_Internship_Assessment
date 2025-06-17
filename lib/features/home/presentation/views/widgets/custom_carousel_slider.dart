import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> imageUrls;
  const CustomCarouselSlider({super.key, required this.imageUrls});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          items: widget.imageUrls.map((imageUrl) {
            return SizedBox(
              width: 375.w,
              height: 200.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            );
          }).toList(),
        ),
        4.height,
        DotsIndicator(
          dotsCount: widget.imageUrls.length,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: ColorsManager.kPrimaryColor,
            color: const Color(0xFFD9D9D9),
            size: Size(8.w, 8.h),
            activeSize: Size(8.w, 8.h),
            spacing: EdgeInsets.symmetric(horizontal: 5.w),
          ),
        ),
      ],
    );
  }
}
