import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_service_item_widget.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomServicesWidget extends StatelessWidget {
  const CustomServicesWidget({super.key, required this.services});
  final List<ServiceEntity> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.height,
        Text('Services', style: TextStyles.dmSans20Bold),
        19.height,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final service = services[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomServiceItemWidget(
                  imagePath: service.image,
                  text: service.tag,
                  text2: service.name,
                ),
              );
            },
          ),
        ),        19.height,
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
