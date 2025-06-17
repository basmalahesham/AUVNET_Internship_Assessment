part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
  @override
  List<Object> get props => [];
}

class LoadServices extends ServiceEvent {}