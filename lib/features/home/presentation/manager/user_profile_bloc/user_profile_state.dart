part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState extends Equatable {
  const UserProfileState();
  @override
  List<Object?> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  final UserProfileEntity profile;
  const UserProfileSuccess(this.profile);
  @override
  List<Object?> get props => [profile];
}

class UserProfileFailure extends UserProfileState {
  final String message;
  const UserProfileFailure(this.message);
  @override
  List<Object?> get props => [message];
}