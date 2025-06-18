import 'dart:async';

import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServicesUseCase getServices;
  StreamSubscription<List<ServiceEntity>>? _subscription;

  ServiceBloc(this.getServices) : super(ServiceInitial()) {
    on<LoadServices>(_onLoadServices);
    on<_ServicesUpdated>(_onServicesUpdated);
  }

  Future<void> _onLoadServices(
      LoadServices event,
      Emitter<ServiceState> emit,
      ) async {
    emit(ServiceLoading());

    await _subscription?.cancel();
    _subscription = getServices().listen((services) {
      add(_ServicesUpdated(services));
    });
  }

  void _onServicesUpdated(_ServicesUpdated event, Emitter<ServiceState> emit) {
    emit(ServiceSuccess(event.services));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}