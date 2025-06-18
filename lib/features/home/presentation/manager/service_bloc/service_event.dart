part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
  @override
  List<Object> get props => [];
}

class LoadServices extends ServiceEvent {}

class _ServicesUpdated extends ServiceEvent {
  final List<ServiceEntity> services;
  const _ServicesUpdated(this.services);
  @override
  List<Object> get props => [services];
}

class _ServicesFailed extends ServiceEvent {
  final String message;
  const _ServicesFailed(this.message);
  @override
  List<Object> get props => [message];
}
