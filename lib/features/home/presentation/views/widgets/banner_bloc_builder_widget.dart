import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/banner_bloc/banner_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerBlocBuilderWidget extends StatelessWidget {
  const BannerBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return const CircularProgressIndicator();
        } else if (state is BannerFailure) {
          return Center(child: Text(state.message));
        } else if (state is BannerSuccess) {
          return CustomCarouselSlider(
            imageUrls: state.banners.map((b) => b.imageUrl).toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
