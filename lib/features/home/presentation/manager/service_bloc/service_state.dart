part of 'service_bloc.dart';

@immutable
abstract class ServiceState extends Equatable {
  const ServiceState();
  @override
  List<Object?> get props => [];
}

class ServiceInitial extends ServiceState {}

class ServiceLoading extends ServiceState {}

class ServiceSuccess extends ServiceState {
  final List<ServiceEntity> services;
  const ServiceSuccess(this.services);
  @override
  List<Object?> get props => [services];
}

class ServiceFailure extends ServiceState {
  final String message;
  const ServiceFailure(this.message);
  @override
  List<Object?> get props => [message];
}