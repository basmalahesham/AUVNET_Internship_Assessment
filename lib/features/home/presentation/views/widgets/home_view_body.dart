import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_appbar_widget.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_services_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbarWidget(),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(children: [CustomServicesWidget()]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
