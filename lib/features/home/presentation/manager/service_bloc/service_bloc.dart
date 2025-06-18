import 'dart:async';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/service_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_services_usecase.dart';
import 'package:auvnet_flutter_internship_assessment/core/errors/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final GetServicesUseCase getServices;
  StreamSubscription<Either<Failure, List<ServiceEntity>>>? _subscription;

  ServiceBloc(this.getServices) : super(ServiceInitial()) {
    on<LoadServices>(_onLoadServices);
    on<_ServicesUpdated>(_onServicesUpdated);
    on<_ServicesFailed>(_onServicesFailed);
  }

  Future<void> _onLoadServices(
    LoadServices event,
    Emitter<ServiceState> emit,
  ) async {
    emit(ServiceLoading());

    await _subscription?.cancel();
    _subscription = getServices().listen((result) {
      result.fold(
        (failure) => add(_ServicesFailed(failure.message)),
        (services) => add(_ServicesUpdated(services)),
      );
    });
  }

  void _onServicesUpdated(_ServicesUpdated event, Emitter<ServiceState> emit) {
    emit(ServiceSuccess(event.services));
  }

  void _onServicesFailed(_ServicesFailed event, Emitter<ServiceState> emit) {
    emit(ServiceFailure(event.message));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
