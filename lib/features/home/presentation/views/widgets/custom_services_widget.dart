import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_service_item_widget.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServicesWidget extends StatelessWidget {
  const CustomServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.height,
        Text('Services', style: TextStyles.dmSans20Bold),
        19.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomServiceItemWidget(
              imagePath: Assets.imagesFood1,
              text: 'Up to 50%',
              text2: 'food',
            ),
            CustomServiceItemWidget(
              imagePath: Assets.imagesFood1,
              text: '20 mins',
              text2: 'Health &\nwellness',
            ),
            CustomServiceItemWidget(
              imagePath: Assets.imagesFood1,
              text: '15 mins',
              text2: 'Groceries',
            ),
          ],
        ),
        19.height,
        Container(
          width: double.infinity,
          height: 89.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(-2, -2), // changes position of shadow
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(Assets.imagesSecurityVault),
              4.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Got a code !',
                    style: TextStyles.dmSans14Bold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Add your code and save on your\norder',
                    style: TextStyles.dmSans10Medium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
