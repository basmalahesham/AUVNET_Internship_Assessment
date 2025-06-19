import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/core/theming/styles/text_styles.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    super.key,
    required this.user,
    this.isPlaceholder = false,
  });

  final UserProfileEntity user;
  final bool isPlaceholder;

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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*.6,
                  child: Text(
                    isPlaceholder ? 'Loading address...' : user.address,
                    style: TextStyles.dmSans16Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                7.height,
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*.6,
                  child: Text(
                    isPlaceholder
                        ? 'Hi there!'
                        : 'Hi ${user.name.split(' ').first}!',
                    style: TextStyles.rubik30Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            ClipOval(
              child: Image.asset(
                Assets.imagesPlaceholder,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
