part of 'banner_bloc.dart';

@immutable
abstract class BannerEvent extends Equatable {
  const BannerEvent();
  @override
  List<Object> get props => [];
}

class LoadBanners extends BannerEvent {}