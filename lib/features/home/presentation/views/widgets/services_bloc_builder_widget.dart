import 'package:auvnet_flutter_internship_assessment/features/home/presentation/manager/service_bloc/service_bloc.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/widgets/custom_services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBlocBuilderWidget extends StatelessWidget {
  const ServicesBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return const CircularProgressIndicator();
        } else if (state is ServiceFailure) {
          return Center(child: Text(state.message));
        } else if (state is ServiceSuccess) {
          return CustomServicesWidget(
            services: state.services,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
