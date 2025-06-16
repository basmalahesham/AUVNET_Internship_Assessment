import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_popular_restaurants_nearby_item_widgets.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopularRestaurantsNearbyWidgets extends StatelessWidget {
  CustomPopularRestaurantsNearbyWidgets({super.key});
  final items = [
    {'image': Assets.imagesR1, 'text': 'Allo Beirut ', 'text2': '32 mins'},
    {'image': Assets.imagesR2, 'text': 'Laffah', 'text2': '38 mins'},
    {
      'image': Assets.imagesR3,
      'text': 'Falafil Al\nRabiah Al kha...',
      'text2': '44 mins',
    },
    {'image': Assets.imagesR4, 'text': 'Barbar', 'text2': '34 mins'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Popular restaurants nearby:', style: TextStyles.dmSans20Bold),
        19.height,
        SizedBox(
          height: 140.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomPopularRestaurantsNearbyItemWidgets(
                  imagePath: item['image']!,
                  text: item['text']!,
                  text2: item['text2']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
