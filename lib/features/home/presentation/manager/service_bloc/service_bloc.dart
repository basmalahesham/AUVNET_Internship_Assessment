import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServicesUseCase getServices;

  ServiceBloc(this.getServices) : super(ServiceInitial()) {
    on<LoadServices>(_onLoadServices);
  }

  Future<void> _onLoadServices(
    LoadServices event,
    Emitter<ServiceState> emit,
  ) async {
    emit(ServiceLoading());

    final result = await getServices();
    result.fold(
      (failure) => emit(ServiceFailure(failure.message)),
      (services) => emit(ServiceSuccess(services)),
    );
  }
}
