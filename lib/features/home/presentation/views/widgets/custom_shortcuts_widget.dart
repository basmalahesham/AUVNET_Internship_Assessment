import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_shortcut_item_widget.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShortcutsWidget extends StatelessWidget {
  CustomShortcutsWidget({super.key});
  final items = [
    {'image': Assets.imagesPastOrders, 'text': 'Past\norders'},
    {'image': Assets.imagesSuperSaver, 'text': 'Super\nSaver'},
    {'image': Assets.imagesMustTries, 'text': 'Must-tries'},
    {'image': Assets.imagesGiveBack, 'text': 'Give Back'},
    {'image': Assets.imagesBestSellers, 'text': 'Best\nSellers'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shortcuts:', style: TextStyles.dmSans20Bold),
        19.height,
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomShortcutItemWidget(
                  imagePath: item['image']!,
                  text: item['text']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
