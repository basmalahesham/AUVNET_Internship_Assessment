import 'package:auvnet_flutter_internship_assessment/features/home/domain/entities/user_profile_entity.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/domain/use_cases/get_user_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfileUseCase getUserProfile;

  UserProfileBloc(this.getUserProfile) : super(UserProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<UserProfileState> emit) async {
    emit(UserProfileLoading());

    final result = await getUserProfile(event.userId);
    result.fold(
          (failure) => emit(UserProfileFailure(failure.message)),
          (profile) => emit(UserProfileSuccess(profile)),
    );
  }
}
