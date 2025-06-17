import 'package:auvnet_flutter_internship_assessment/core/helper/space_extension.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/banner_bloc_builder_widget.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_shortcuts_widget.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/restaurant_bloc_builder_widget.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/services_bloc_builder_widget.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/user_profile_bloc_builder_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileBlocBuilderWidget(),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ServicesBlocBuilderWidget(),
                      14.height,
                      CustomShortcutsWidget(),
                      32.height,
                      BannerBlocBuilderWidget(),
                      34.height,
                      RestaurantBlocBuilderWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
