import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/restaurant_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_popular_restaurants_nearby_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopularRestaurantsNearbyWidgets extends StatelessWidget {
  final List<RestaurantEntity> restaurants;

  const CustomPopularRestaurantsNearbyWidgets({
    super.key,
    required this.restaurants,
  });
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
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final item = restaurants[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomPopularRestaurantsNearbyItemWidgets(
                  imagePath: item.image,
                  text: item.name,
                  text2: item.deliveryTime,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
