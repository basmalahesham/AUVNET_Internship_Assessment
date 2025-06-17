import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/banner_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_banners_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUseCase getBanners;

  BannerBloc(this.getBanners) : super(BannerInitial()) {
    on<LoadBanners>(_onLoadBanners);
  }

  Future<void> _onLoadBanners(LoadBanners event, Emitter<BannerState> emit) async {
    emit(BannerLoading());

    final result = await getBanners();
    result.fold(
          (failure) => emit(BannerFailure(failure.message)),
          (banners) => emit(BannerSuccess(banners)),
    );
  }
}
