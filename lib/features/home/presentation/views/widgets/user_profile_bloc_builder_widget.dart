import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/user_profile_bloc/user_profile_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_appbar_widget.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileBlocBuilderWidget extends StatelessWidget {
  const UserProfileBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileSuccess) {
          return CustomAppbarWidget(user: state.profile, isPlaceholder: false);
        } else {
          return CustomAppbarWidget(
            user: UserProfileEntity(
              name: 'Guest',
              address: 'Loading address...',
              imageUrl: Assets.imagesPlaceholder,
              id: '',
            ),
            isPlaceholder: true,
          );
        }
      },
    );
  }
}
