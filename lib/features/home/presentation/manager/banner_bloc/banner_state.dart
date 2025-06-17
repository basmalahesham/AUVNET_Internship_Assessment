part of 'banner_bloc.dart';

@immutable
abstract class BannerState extends Equatable {
  const BannerState();
  @override
  List<Object?> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerEntity> banners;
  const BannerSuccess(this.banners);
  @override
  List<Object?> get props => [banners];
}

class BannerFailure extends BannerState {
  final String message;
  const BannerFailure(this.message);
  @override
  List<Object?> get props => [message];
}